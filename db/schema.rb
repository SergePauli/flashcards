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

ActiveRecord::Schema.define(version: 2022_09_18_024455) do

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "level", default: 0
    t.datetime "lock_to"
    t.integer "attempts", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attempts"], name: "index_cards_on_attempts"
    t.index ["level"], name: "index_cards_on_level"
    t.index ["lock_to"], name: "index_cards_on_lock_to"
  end

end
