# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_17_170657) do

  create_table "svg_map_countries", force: :cascade do |t|
    t.string "pathID"
    t.text "pathD"
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "geoId"
    t.string "juristic"
    t.integer "methodNumber"
    t.integer "fajr"
    t.integer "isha"
    t.text "ajaxUrl"
    t.string "scrapedDate"
    t.string "country"
    t.string "capital"
    t.integer "hijriDay"
    t.integer "hijriMonth"
    t.integer "hijriYear"
    t.datetime "lastUpdate"
    t.integer "hijriNight"
    t.time "fajrTime"
    t.time "duhrTime"
    t.time "asrTime"
    t.time "maghribTime"
    t.time "ishaTime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
