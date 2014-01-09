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

ActiveRecord::Schema.define(version: 20140109034521) do

  create_table "configures", force: true do |t|
    t.integer  "task_id"
    t.string   "s1"
    t.string   "s2"
    t.string   "s3"
    t.string   "s4"
    t.string   "f1"
    t.string   "f2"
    t.string   "f3"
    t.string   "f4"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "task_id"
    t.integer  "return"
    t.string   "stdout"
    t.string   "logfile"
    t.string   "errfile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "owner"
    t.string   "desc"
    t.integer  "tool_id"
    t.integer  "configure_id"
    t.integer  "result_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tools", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "cmd"
    t.string   "p1"
    t.string   "p1_desc"
    t.string   "p2"
    t.string   "p2_desc"
    t.string   "p3"
    t.string   "p3_desc"
    t.string   "p4"
    t.string   "p4_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
