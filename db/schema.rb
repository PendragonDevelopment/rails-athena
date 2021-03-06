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

ActiveRecord::Schema.define(:version => 20140401162603) do

  create_table "agenda_items", :force => true do |t|
    t.datetime "start"
    t.datetime "end_time"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "workshop_id"
  end

  add_index "agenda_items", ["workshop_id"], :name => "index_agenda_items_on_workshop_id"

  create_table "applications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "workshop_id"
    t.text     "experience_level"
    t.text     "previous_experience"
    t.string   "rails_experience"
    t.text     "good_candidate"
    t.text     "why_rails"
    t.text     "questions"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.datetime "deadline"
  end

  add_index "applications", ["user_id"], :name => "index_applications_on_user_id"
  add_index "applications", ["workshop_id"], :name => "index_applications_on_workshop_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "phone"
    t.string   "street"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.text     "description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "slug"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "name"
    t.string   "slug"
    t.string   "phone"
    t.string   "twitter"
    t.string   "github"
    t.string   "os"
    t.string   "shirt_size"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "bio"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token", :unique => true
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "workshop_sponsors", :force => true do |t|
    t.integer  "sponsor_id"
    t.integer  "workshop_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "workshop_sponsors", ["sponsor_id"], :name => "index_workshop_sponsors_on_sponsor_id"
  add_index "workshop_sponsors", ["workshop_id"], :name => "index_workshop_sponsors_on_workshop_id"

  create_table "workshop_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "workshop_id"
    t.string   "workshop_role"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "workshop_users", ["user_id"], :name => "index_workshop_users_on_user_id"
  add_index "workshop_users", ["workshop_id"], :name => "index_workshop_users_on_workshop_id"

  create_table "workshops", :force => true do |t|
    t.datetime "start_date"
    t.string   "street"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "title"
    t.datetime "end_date"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
    t.datetime "deadline"
  end

end
