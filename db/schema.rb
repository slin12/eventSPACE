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

ActiveRecord::Schema.define(version: 20171115175833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.string "title"
    t.integer "location_id"
    t.boolean "admittance", default: true
    t.integer "host_id"
    t.time "time"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city_state"
    t.integer "zip"
    t.string "phone"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.string "attending"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.text "bio"
    t.date "birthday"
    t.string "profile"
    t.text "embed"
  end

end
