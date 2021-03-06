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

ActiveRecord::Schema.define(version: 20140803111617) do

  create_table "notificators", force: true do |t|
    t.string "name"
    t.string "notifying_host"
    t.string "slug"
  end

  add_index "notificators", ["slug"], name: "index_notificators_on_slug", unique: true

  create_table "notificators_projects", id: false, force: true do |t|
    t.integer "notificator_id", null: false
    t.integer "project_id",     null: false
  end

  add_index "notificators_projects", ["notificator_id"], name: "index_notificators_projects_on_notificator_id"
  add_index "notificators_projects", ["project_id"], name: "index_notificators_projects_on_project_id"

  create_table "payloads", force: true do |t|
    t.text    "blob"
    t.string  "notificator_id"
    t.string  "request_host"
    t.string  "repo_url"
    t.integer "project_id"
  end

  add_index "payloads", ["project_id"], name: "index_payloads_on_project_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true

end
