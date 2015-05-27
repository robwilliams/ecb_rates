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

ActiveRecord::Schema.define(version: 20150526102939) do

  create_table "daily_feeds", force: :cascade do |t|
    t.datetime "feed_updated_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "rates", force: :cascade do |t|
    t.string   "currency",                              default: ""
    t.decimal  "amount",        precision: 10, scale: 8, default: 0.0, null: false
    t.integer  "daily_feed_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "rates", ["daily_feed_id"], name: "index_rates_on_daily_feed_id"

end
