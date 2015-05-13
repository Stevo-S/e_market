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

ActiveRecord::Schema.define(version: 20150426212852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "children_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["children_count"], name: "index_categories_on_children_count", using: :btree
  add_index "categories", ["depth"], name: "index_categories_on_depth", using: :btree
  add_index "categories", ["lft"], name: "index_categories_on_lft", using: :btree
  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree
  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  add_index "categories", ["rgt"], name: "index_categories_on_rgt", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.string   "title"
    t.string   "sub_location_title"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "children_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["children_count"], name: "index_locations_on_children_count", using: :btree
  add_index "locations", ["depth"], name: "index_locations_on_depth", using: :btree
  add_index "locations", ["lft"], name: "index_locations_on_lft", using: :btree
  add_index "locations", ["name"], name: "index_locations_on_name", using: :btree
  add_index "locations", ["parent_id"], name: "index_locations_on_parent_id", using: :btree
  add_index "locations", ["rgt"], name: "index_locations_on_rgt", using: :btree
  add_index "locations", ["sub_location_title"], name: "index_locations_on_sub_location_title", using: :btree
  add_index "locations", ["title"], name: "index_locations_on_title", using: :btree

  create_table "posts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "product_name"
    t.float    "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "picture"
    t.integer  "category_id"
    t.integer  "location_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["location_id"], name: "index_products_on_location_id", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "profile_picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
