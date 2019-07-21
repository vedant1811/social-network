class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships, primary_key: false do |t|
      t.belongs_to :profile_1, foreign_key: {to_table: :profiles}, index: true, null: false
      t.belongs_to :profile_2, foreign_key: {to_table: :profiles}, index: true, null: false

      t.timestamps
    end
  end
end
