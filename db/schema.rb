# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_21_151806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", primary_key: "false", force: :cascade do |t|
    t.bigint "profile_1_id", null: false
    t.bigint "profile_2_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_1_id", "profile_2_id"], name: "index_friendships_on_profile_1_id_and_profile_2_id", unique: true
    t.index ["profile_1_id"], name: "index_friendships_on_profile_1_id"
    t.index ["profile_2_id", "profile_1_id"], name: "index_friendships_on_profile_2_id_and_profile_1_id", unique: true
    t.index ["profile_2_id"], name: "index_friendships_on_profile_2_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests_profiles", primary_key: "false", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "interest_id", null: false
    t.index ["interest_id"], name: "index_interests_profiles_on_interest_id"
    t.index ["profile_id", "interest_id"], name: "index_interests_profiles_on_profile_id_and_interest_id", unique: true
    t.index ["profile_id"], name: "index_interests_profiles_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.text "name"
    t.date "dob"
    t.integer "gender"
    t.text "location"
    t.text "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "friendships", "profiles", column: "profile_1_id"
  add_foreign_key "friendships", "profiles", column: "profile_2_id"
  add_foreign_key "interests_profiles", "interests"
  add_foreign_key "interests_profiles", "profiles"
end
