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

ActiveRecord::Schema.define(version: 20151230014125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_subtypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_subtypes_cards", id: false, force: true do |t|
    t.integer "card_id"
    t.integer "card_subtype_id"
  end

  add_index "card_subtypes_cards", ["card_id"], name: "index_card_subtypes_cards_on_card_id", using: :btree
  add_index "card_subtypes_cards", ["card_subtype_id"], name: "index_card_subtypes_cards_on_card_subtype_id", using: :btree

  create_table "card_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_types_cards", id: false, force: true do |t|
    t.integer "card_id"
    t.integer "card_type_id"
  end

  add_index "card_types_cards", ["card_id"], name: "index_card_types_cards_on_card_id", using: :btree
  add_index "card_types_cards", ["card_type_id"], name: "index_card_types_cards_on_card_type_id", using: :btree

  create_table "cards", force: true do |t|
    t.string   "name"
    t.string   "text1"
    t.string   "text2"
    t.string   "text3"
    t.string   "text4"
    t.string   "text5"
    t.string   "text6"
    t.string   "text7"
    t.string   "text8"
    t.integer  "expansion_id"
    t.integer  "faction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cost"
    t.string   "slug"
  end

  create_table "comments", force: true do |t|
    t.integer  "cards_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_id"
    t.integer  "user_id"
  end

  create_table "expansions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "factions", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.integer  "authority",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "slug"
  end

end
