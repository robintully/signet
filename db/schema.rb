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

ActiveRecord::Schema.define(version: 20160608134609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archives", force: :cascade do |t|
    t.integer "envelope_id"
    t.binary  "archive_file"
    t.index ["envelope_id"], name: "index_archives_on_envelope_id", using: :btree
  end

  create_table "envelopes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "expiration"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "archives"
  end

  create_table "parchments", force: :cascade do |t|
    t.string   "s3_url"
    t.integer  "envelope_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "parcel_file_name"
    t.string   "parcel_content_type"
    t.integer  "parcel_file_size"
    t.datetime "parcel_updated_at"
    t.string   "file"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email_address"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
  end

end
