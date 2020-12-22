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

ActiveRecord::Schema.define(version: 20201222022301) do

  create_table "cases", force: :cascade do |t|
    t.string  "location"
    t.string  "description"
    t.integer "hunter1_id"
    t.integer "hunter2_id"
    t.integer "monster_id"
  end

  create_table "hunters", force: :cascade do |t|
    t.string  "name"
    t.integer "age"
    t.string  "email"
    t.string  "username"
    t.string  "password_digest"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "species"
    t.string "lore"
    t.string "how_to_kill"
  end

end
