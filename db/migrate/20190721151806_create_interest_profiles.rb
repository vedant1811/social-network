class CreateInterestProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :interests_profiles, primary_key: false do |t|
      t.belongs_to :profile, null: false, foreign_key: true, index: true
      t.belongs_to :interest, null: false, foreign_key: true, index: true
    end
    add_index(:interests_profiles, [:profile_id, :interest_id], unique: true)
  end
end
