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

ActiveRecord::Schema.define(version: 2020_02_12_012623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anime", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "year"
    t.string "genre"
    t.integer "episodes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age"
    t.string "gender"
    t.float "height"
    t.float "weight"
    t.string "birthday"
    t.string "eye_color"
    t.string "hair_color"
    t.string "voice_actor"
    t.integer "anime_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id"], name: "index_characters_on_anime_id"
  end

end
