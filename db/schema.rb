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

ActiveRecord::Schema.define(:version => 20130708192156) do

  #create_table "active_admin_comments", :force => true do |t|
    #t.string   "resource_id",   :null => false
    #t.string   "resource_type", :null => false
    #t.integer  "author_id"
    #t.string   "author_type"
    #t.text     "body"
    #t.datetime "created_at",    :null => false
    #t.datetime "updated_at",    :null => false
    #t.string   "namespace"
  #end

  #add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  #add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  #add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  #create_table "admin_users", :force => true do |t|
  #  t.string   "email",                  :default => "", :null => false
  #  t.string   "encrypted_password",     :default => "", :null => false
  #  t.string   "reset_password_token"
  #  t.datetime "reset_password_sent_at"
  #  t.datetime "remember_created_at"
  #  t.integer  "sign_in_count",          :default => 0
  #  t.datetime "current_sign_in_at"
  #  t.datetime "last_sign_in_at"
  #  t.string   "current_sign_in_ip"
  #  t.string   "last_sign_in_ip"
  #  t.datetime "created_at",                             :null => false
  #  t.datetime "updated_at",                             :null => false
  #  t.string   "username"
  #end

  #add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  #add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "owner_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "email_messages", :force => true do |t|
    t.string   "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "label"
    t.string   "subject"
    t.text     "html"
  end

  create_table "email_submissions", :force => true do |t|
    t.string   "email_id"
    t.string   "email_message_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "server_id"
    t.boolean  "isdelivered",      :default => false
    t.integer  "priority"
    t.string   "list_mail_id"
    t.string   "server_list_id"
    t.integer  "visit_count",      :default => 0
  end

  create_table "emails", :force => true do |t|
    t.string   "emailAddress"
    t.string   "user_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "name",         :default => "None"
    t.integer  "count"
    t.boolean  "subscribed",   :default => true
    t.string   "company"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "title"
    t.integer  "visit_count",  :default => 0
  end

  create_table "emails_mailing_lists", :id => false, :force => true do |t|
    t.integer "email_id"
    t.integer "mailing_list_id"
  end

  create_table "list_mails", :force => true do |t|
    t.string   "name"
    t.string   "server_list_id"
    t.string   "mailing_list_id"
    t.string   "message_id"
    t.boolean  "completed",           :default => false
    t.integer  "priority",            :default => 5
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email_submission_id"
    t.integer  "count"
    t.integer  "total_visit_count",   :default => 0
  end

  create_table "mailing_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
    t.boolean  "active"
  end

  create_table "owners", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "server_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "server_lists_servers", :id => false, :force => true do |t|
    t.integer "server_list_id"
    t.integer "server_id"
  end

  create_table "servers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "port"
    t.string   "authentication"
    t.string   "user_name"
    t.string   "password_digest"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "server_list_id"
    t.string   "server_password"
    t.integer  "max_emails",      :default => 0
    t.datetime "current_day"
    t.integer  "count_day"
    t.boolean  "is_active",       :default => true
    t.string   "host"
  end

  create_table "servers_server_lists", :id => false, :force => true do |t|
    t.integer "server_id"
    t.integer "server_list_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "will_filter_filters", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "data"
    t.integer  "user_id"
    t.string   "model_class_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "will_filter_filters", ["user_id"], :name => "index_will_filter_filters_on_user_id"

end
