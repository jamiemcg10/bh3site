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

ActiveRecord::Schema.define(version: 20160105025510) do

  create_table "event_registrations", force: true do |t|
    t.integer  "special_event_id"
    t.string   "contact_email"
    t.string   "hash_name"
    t.string   "nerd_name"
    t.string   "kennel"
    t.string   "payment_email"
    t.string   "food_preference"
    t.boolean  "gluten_allergy"
    t.boolean  "need_crash_space"
    t.string   "extra_hab"
    t.string   "extra_hab_size"
    t.date     "registration_date"
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hash_events", force: true do |t|
    t.string   "google_id"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_sections", force: true do |t|
    t.string   "tag"
    t.string   "data_type"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "special_events", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url_code"
  end

end
