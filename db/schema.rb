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

ActiveRecord::Schema.define(version: 20131120152550) do

  create_table "children", force: true do |t|
    t.string   "first_name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "children", ["parent_id"], name: "index_children_on_parent_id"

  create_table "friendships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "child_id"
    t.integer  "friend_id"
  end

  create_table "invitations", force: true do |t|
    t.integer  "child_id"
    t.string   "secret_code"
    t.datetime "expiry_date"
    t.string   "status"
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["child_id"], name: "index_invitations_on_child_id"
  add_index "invitations", ["message_id"], name: "index_invitations_on_message_id"

  create_table "messages", force: true do |t|
    t.integer  "friendship_id"
    t.string   "data"
    t.boolean  "parent_approval"
    t.boolean  "friend_parent_approval"
    t.datetime "expiry_date"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "friend_id"
    t.integer  "invitition_id"
  end

  add_index "messages", ["invitition_id"], name: "index_messages_on_invitition_id"

  create_table "parents", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
