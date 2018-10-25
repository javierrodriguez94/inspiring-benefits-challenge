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

ActiveRecord::Schema.define(version: 2018_10_25_151757) do

  create_table "facts", force: :cascade do |t|
    t.string "ref_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_facts", force: :cascade do |t|
    t.integer "search_id"
    t.integer "fact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fact_id"], name: "index_search_facts_on_fact_id"
    t.index ["search_id"], name: "index_search_facts_on_search_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "search_type"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
