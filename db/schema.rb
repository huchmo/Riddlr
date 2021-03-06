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

ActiveRecord::Schema.define(version: 20150216232433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: true do |t|
    t.string   "title",               null: false
    t.integer  "owner_id",            null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "profile_image"
    t.integer  "posts_count"
    t.integer  "subscriptions_count"
    t.string   "background_image"
  end

  add_index "blogs", ["title"], name: "index_blogs_on_title", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: true do |t|
    t.integer  "user_id",          null: false
    t.integer  "blog_id",          null: false
    t.string   "title",            null: false
    t.text     "body",             null: false
    t.string   "content_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "filepicker_url"
    t.string   "blog_picture_url"
    t.integer  "likes_count"
  end

  add_index "posts", ["body"], name: "index_posts_on_body", using: :btree
  add_index "posts", ["title"], name: "index_posts_on_title", using: :btree

  create_table "subscriptions", force: true do |t|
    t.integer  "blog_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "gravatar_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "phone_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree

end
