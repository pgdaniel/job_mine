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

ActiveRecord::Schema.define(version: 20150323145315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "common_words", force: :cascade do |t|
    t.string   "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.boolean  "complete"
  end

  create_table "listings", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "company"
    t.string   "company_url"
    t.string   "url"
    t.integer  "search_term_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "type"
    t.string   "city"
  end

  add_index "listings", ["search_term_id"], name: "index_listings_on_search_term_id", using: :btree

  create_table "search_terms", force: :cascade do |t|
    t.string   "value"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "search_terms", ["job_id"], name: "index_search_terms_on_job_id", using: :btree

  add_foreign_key "listings", "search_terms"
  add_foreign_key "search_terms", "jobs"
end
