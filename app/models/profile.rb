class Profile < ApplicationRecord
  has_and_belongs_to_many :interests

  enum gender: [ :male, :female ]

  validates :name, presence: true, blank: false
  validates :photo_url, allow_blank: true, format: URI::regexp(%w[http https])

  def age
    dob && ((Time.zone.now - dob.to_time) / 1.year.seconds).floor
  end

  def friend_suggestions
    suggestions = friends_of_friends
    if suggestions.count < 100
      suggestions += Profile.order(Arel.sql('random()')).limit(100 - suggestions.count)
    end
    suggestions
  end

  def friends
    Profile.create_sql_views

    query = <<-SQL
      SELECT * FROM profiles
      WHERE id IN (#{Profile.friend_ids(id)})
      ;
    SQL

    Profile.find_by_sql(query)
  end

  def friends_of_friends
    Profile.create_sql_views

    friend_ids_subquery = Profile.friend_ids(id)

    query = <<-SQL
      SELECT * FROM profiles
      WHERE id IN (
        SELECT friend_id FROM all_friendships
        WHERE profile_id IN (#{friend_ids_subquery})
        EXCEPT
        #{friend_ids_subquery}
        EXCEPT
        SELECT '#{Profile.sanitize_sql id}' AS friend_id
      )
      ;
    SQL

    Profile.find_by_sql(query)
  end

private
  # TODO: Put this in a migration rather than running every time
  def self.create_sql_views
    # UNION operator removes duplicates
    connection.execute <<-SQL
      CREATE OR REPLACE VIEW all_friendships AS
      SELECT profile_1_id AS profile_id, profile_2_id AS friend_id FROM friendships
      UNION
      SELECT profile_2_id AS profile_id, profile_1_id AS friend_id FROM friendships;
    SQL
  end

  def self.friend_ids(id)
    "SELECT friend_id FROM all_friendships WHERE profile_id = '#{Profile.sanitize_sql id}'"
  end
end
