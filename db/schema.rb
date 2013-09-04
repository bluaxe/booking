# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130904185600) do

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "date"
    t.integer  "time"
    t.integer  "type"
    t.integer  "allowed"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.text     "info"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.text     "info"
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["place_id"], name: "index_rooms_on_place_id"

  create_table "time_tables", force: true do |t|
    t.integer  "room_id"
    t.integer  "Mon_b"
    t.integer  "Mon_e"
    t.integer  "Tue_b"
    t.integer  "Tue_e"
    t.integer  "Wen_b"
    t.integer  "Wen_e"
    t.integer  "Thu_b"
    t.integer  "Thu_e"
    t.integer  "Fri_b"
    t.integer  "Fri_e"
    t.integer  "Sat_b"
    t.integer  "Sat_e"
    t.integer  "Sun_b"
    t.integer  "Sun_e"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.string   "user_pwd"
    t.string   "user_mail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
