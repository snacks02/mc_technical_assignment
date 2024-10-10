# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_10_094110) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "match_performances_role", ["attacker", "defender", "goalkeeper", "midfielder"]

  create_table "match_performances", force: :cascade do |t|
    t.enum "role", null: false, enum_type: "match_performances_role"
    t.float "rating"
    t.integer "goals", default: 0, null: false
    t.integer "passes", default: 0, null: false
    t.integer "saves", default: 0, null: false
    t.bigint "match_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_match_performances_on_match_id"
    t.index ["player_id"], name: "index_match_performances_on_player_id"
  end

  create_table "matches", force: :cascade do |t|
    t.float "weight", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "match_performances", "matches"
  add_foreign_key "match_performances", "players"
  add_foreign_key "players", "teams"
end
