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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130325052132) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "event_date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "flags", :force => true do |t|
    t.string   "reason"
    t.text     "comment"
    t.integer  "flaggable_id"
    t.string   "flaggable_type"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "flags", ["user_id"], :name => "index_flags_on_user_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.integer  "user_id"
    t.string   "image"
    t.integer  "quantity"
    t.string   "condition"
    t.decimal  "length"
    t.decimal  "width"
    t.decimal  "height"
    t.decimal  "price"
    t.date     "available_from"
    t.date     "available_until"
    t.decimal  "weight"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "locatable_id"
    t.string   "locatable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "news", ["user_id"], :name => "index_news_on_user_id"

  create_table "old_items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "category"
    t.integer  "quantity"
    t.string   "condition"
    t.decimal  "length"
    t.decimal  "width"
    t.decimal  "height"
    t.decimal  "price"
    t.decimal  "weight"
    t.date     "available_from"
    t.date     "available_until"
    t.string   "reason"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "preferences", :force => true do |t|
    t.string   "name"
    t.boolean  "preference_value"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "preferences", ["user_id"], :name => "index_preferences_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "image"
    t.boolean  "admin",                  :default => false
    t.boolean  "banned",                 :default => false
    t.boolean  "confirmed",              :default => false
    t.string   "confirm_code"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "wish_lists", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "category"
    t.string   "location"
    t.integer  "user_id"
    t.string   "condition"
    t.integer  "quantity"
    t.decimal  "length"
    t.decimal  "width"
    t.decimal  "height"
    t.decimal  "price"
    t.decimal  "weight"
    t.date     "available_until"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "wish_lists", ["user_id"], :name => "index_wish_lists_on_user_id"

end
