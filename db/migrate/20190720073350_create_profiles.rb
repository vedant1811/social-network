class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :name
      t.date :dob
      t.integer :gender
      t.text :location
      t.text :photo_url

      t.timestamps
    end
  end
end
