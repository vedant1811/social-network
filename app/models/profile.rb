class Profile < ApplicationRecord
  enum gender: [ :male, :female ]

  validates :name, presence: true, blank: false
  validates :photo_url, allow_blank: true, format: URI::regexp(%w[http https])

  def age
    dob && ((Time.zone.now - dob.to_time) / 1.year.seconds).floor
  end


  def friends
    Profile.create_views

    query = <<-SQL
      SELECT * FROM profiles
      WHERE id IN (
        SELECT friend_id FROM all_friendships
        WHERE profile_id = '#{Profile.sanitize_sql id}'
      )
      ;
    SQL

    Profile.find_by_sql(query)
  end

private
  def self.create_views
    # UNION operator removes duplicates
    connection.execute <<-SQL
      CREATE OR REPLACE VIEW all_friendships AS
      SELECT profile_1_id AS profile_id, profile_2_id AS friend_id FROM friendships
      UNION
      SELECT profile_2_id AS profile_id, profile_1_id AS friend_id FROM friendships;
    SQL
  end
end
