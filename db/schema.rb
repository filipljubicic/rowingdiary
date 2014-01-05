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

ActiveRecord::Schema.define(version: 20140105121351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coupons", force: true do |t|
    t.string   "code"
    t.string   "free_trial_length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ergos", force: true do |t|
    t.string   "description"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "time"
    t.string   "distance"
    t.integer  "rate"
    t.string   "split"
    t.string   "watts"
    t.string   "notes"
  end

  add_index "ergos", ["user_id"], name: "index_ergos_on_user_id", using: :btree

  create_table "morning_monitorings", force: true do |t|
    t.integer  "hr"
    t.integer  "sleep"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "morning_monitorings", ["user_id"], name: "index_morning_monitorings_on_user_id", using: :btree

  create_table "pbs", force: true do |t|
    t.string   "distance"
    t.string   "split"
    t.string   "time"
    t.string   "date"
    t.integer  "rate"
    t.integer  "watt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "pbs", ["user_id"], name: "index_pbs_on_user_id", using: :btree

  create_table "plans", force: true do |t|
    t.string   "name"
    t.string   "stripe_id"
    t.float    "price"
    t.string   "interval"
    t.text     "features"
    t.boolean  "highlight"
    t.integer  "display_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_events", force: true do |t|
    t.string   "stripe_id"
    t.string   "stripe_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.string   "stripe_id"
    t.integer  "plan_id"
    t.string   "last_four"
    t.integer  "coupon_id"
    t.string   "card_type"
    t.float    "current_price"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "name"
    t.string   "club"
    t.boolean  "subscribed",             default: false
    t.string   "stripeid"
    t.string   "stripe_card_token"
    t.string   "coupon"
  end

  add_index "users", ["club"], name: "index_users_on_club", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "waters", force: true do |t|
    t.string   "distance"
    t.string   "BoatType"
    t.string   "SessionDescription"
    t.string   "crew"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "waters", ["user_id"], name: "index_waters_on_user_id", using: :btree

  create_table "weights", force: true do |t|
    t.string   "exercise"
    t.string   "reps"
    t.string   "weight"
    t.string   "sets"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "weights", ["exercise"], name: "index_weights_on_exercise", using: :btree
  add_index "weights", ["user_id"], name: "index_weights_on_user_id", using: :btree

end
