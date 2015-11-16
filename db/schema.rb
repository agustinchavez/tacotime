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

ActiveRecord::Schema.define(version: 20151116231417) do

  create_table "gifts", force: :cascade do |t|
    t.integer  "giver_id"
    t.integer  "receiver_id"
    t.integer  "menu_item_id"
    t.boolean  "redeemed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "message"
    t.string   "passphrase"
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name",          limit: 30, null: false
    t.float    "price",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                   limit: 50,               null: false
    t.string   "address",                limit: 150,              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "city"
    t.string   "neighborhood"
  end

  add_index "restaurants", ["email"], name: "index_restaurants_on_email", unique: true
  add_index "restaurants", ["reset_password_token"], name: "index_restaurants_on_reset_password_token", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 20,              null: false
    t.string   "last_name",              limit: 20,              null: false
    t.string   "phone",                                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
