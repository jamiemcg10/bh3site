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

ActiveRecord::Schema.define(version: 2018_01_08_225000) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace", limit: 255
    t.text "body"
    t.string "resource_id", limit: 255, null: false
    t.string "resource_type", limit: 255, null: false
    t.integer "author_id"
    t.string "author_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "event_registrations", force: :cascade do |t|
    t.integer "special_event_id"
    t.string "contact_email", limit: 255
    t.string "hash_name", limit: 255
    t.string "nerd_name", limit: 255
    t.string "kennel", limit: 255
    t.string "payment_email", limit: 255
    t.string "food_preference", limit: 255
    t.boolean "gluten_allergy"
    t.boolean "need_crash_space"
    t.string "extra_hab", limit: 255
    t.string "extra_hab_size", limit: 255
    t.date "registration_date"
    t.boolean "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float "rego_price"
    t.integer "status", default: 0
    t.boolean "dairy_free", default: false
    t.boolean "have_crash_space", default: false
  end

  create_table "events", force: :cascade do |t|
    t.string "google_id", limit: 255
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "location", limit: 255
  end

  create_table "hash_events", force: :cascade do |t|
    t.string "google_id", limit: 255
    t.string "location", limit: 255
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_sections", force: :cascade do |t|
    t.string "tag", limit: 255
    t.string "data_type", limit: 255
    t.text "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "special_events", force: :cascade do |t|
    t.string "name", limit: 255
    t.date "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "url_code", limit: 255
    t.text "tiered_rego_prices"
    t.text "tiered_rego_dates"
    t.float "full_rego_price"
    t.string "extra_hab_type"
    t.float "extra_hab_price"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
