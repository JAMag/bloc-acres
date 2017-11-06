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

ActiveRecord::Schema.define(version: 20171106204753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_offers", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "percentage_financing"
    t.string   "escrow_agent"
    t.integer  "foundation_rating"
    t.integer  "garage_rating"
    t.integer  "windows_rating"
    t.integer  "plumbing_rating"
    t.integer  "furnace_rating"
    t.integer  "roof_rating"
    t.integer  "electric_rating"
    t.integer  "basement_rating"
    t.integer  "kitchen_rating"
    t.integer  "bathroom_rating"
    t.string   "buyer_names"
    t.string   "buyer_address"
    t.string   "seller_names"
    t.string   "seller_address"
    t.string   "property_address"
    t.integer  "pns_deposit"
    t.datetime "closing_date"
    t.datetime "mortgage_application_date"
    t.datetime "mortgage_written_commitment_date"
    t.datetime "inspection_date"
    t.datetime "signing_date"
    t.text     "additional_terms"
    t.integer  "property_id"
  end

  create_table "advertisements", force: :cascade do |t|
    t.string   "image"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "started_at"
    t.integer  "ended_at"
    t.integer  "user_id"
    t.integer  "slot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "avatar"
    t.integer  "price"
  end

  add_index "appointments", ["slot_id"], name: "index_appointments_on_slot_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "property_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["property_id"], name: "index_comments_on_property_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "connections", force: :cascade do |t|
    t.string   "provider"
    t.string   "oauth_token"
    t.string   "secret"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "locks", force: :cascade do |t|
    t.string   "model"
    t.string   "manufacturer"
    t.integer  "property_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "lockitron_id"
  end

  add_index "locks", ["property_id"], name: "index_locks_on_property_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "error"
    t.text     "content"
    t.datetime "scheduled_at"
    t.string   "state"
    t.integer  "user_id"
    t.boolean  "facebook"
    t.boolean  "twitter"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.integer  "price"
    t.string   "category"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "properties", force: :cascade do |t|
    t.string   "structure"
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "price"
    t.json     "photos"
    t.integer  "beds"
    t.integer  "baths"
    t.integer  "sqft"
    t.integer  "lot"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "showcase"
    t.string   "slug"
  end

  add_index "properties", ["user_id"], name: "index_properties_on_user_id", using: :btree

  create_table "slots", force: :cascade do |t|
    t.datetime "start_time"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "slots", ["property_id"], name: "index_slots_on_property_id", using: :btree

  create_table "store_purchases", force: :cascade do |t|
    t.string   "email"
    t.integer  "amount"
    t.string   "description"
    t.string   "currency"
    t.string   "customer_id"
    t.string   "card"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "uuid"
    t.integer  "user_id"
  end

  add_index "store_purchases", ["user_id"], name: "index_store_purchases_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "avatar"
    t.boolean  "progress_has_favorited"
    t.boolean  "subscribed"
    t.string   "stripeid"
    t.string   "saved_search"
    t.string   "time_zone"
    t.boolean  "admin",                  default: false
    t.string   "phone_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "properties"
  add_foreign_key "comments", "users"
  add_foreign_key "store_purchases", "users"
end
