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

ActiveRecord::Schema.define(version: 20140521193158) do

  create_table "profiles", force: true do |t|
    t.string   "username",       null: false
    t.integer  "age",            null: false
    t.string   "gender",         null: false
    t.string   "location",       null: false
    t.text     "summary"
    t.text     "skills"
    t.text     "interests"
    t.text     "life_direction"
    t.text     "goals"
    t.integer  "user_id",        null: false
    t.string   "height"
    t.string   "body_type"
    t.string   "drinks"
    t.string   "job"
    t.string   "income"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["interests"], name: "index_profiles_on_interests"
  add_index "profiles", ["username"], name: "index_profiles_on_username"

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "email",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
