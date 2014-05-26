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

ActiveRecord::Schema.define(version: 20140526222801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_choices", force: true do |t|
    t.string   "choice",      null: false
    t.integer  "question_id", null: false
    t.integer  "value",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answer_choices", ["question_id"], name: "index_answer_choices_on_question_id", using: :btree

  create_table "answered_questions", force: true do |t|
    t.integer  "profile_id",  null: false
    t.integer  "question_id", null: false
    t.integer  "answer_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answered_questions", ["profile_id"], name: "index_answered_questions_on_profile_id", using: :btree
  add_index "answered_questions", ["question_id"], name: "index_answered_questions_on_question_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "sender_id",                   null: false
    t.integer  "receiver_id",                 null: false
    t.string   "title",                       null: false
    t.string   "body",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",        default: false
  end

  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

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
    t.string   "photo_url"
  end

  add_index "profiles", ["interests"], name: "index_profiles_on_interests", using: :btree
  add_index "profiles", ["username"], name: "index_profiles_on_username", using: :btree

  create_table "questions", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "email",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "visits", force: true do |t|
    t.integer  "visitor_id", null: false
    t.integer  "profile_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visits", ["profile_id", "visitor_id"], name: "index_visits_on_profile_id_and_visitor_id", using: :btree
  add_index "visits", ["profile_id"], name: "index_visits_on_profile_id", using: :btree

end
