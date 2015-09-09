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

ActiveRecord::Schema.define(version: 20150909052743) do

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment_type"
    t.integer  "ref_id"
    t.string   "author"
    t.string   "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "code"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plants", force: :cascade do |t|
    t.string   "code"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rfx_items", force: :cascade do |t|
    t.integer  "rfx_id"
    t.integer  "plant_id"
    t.integer  "material_id"
    t.float    "quantity"
    t.date     "required_dt"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rfx_rounds", force: :cascade do |t|
    t.integer  "rfx_id"
    t.string   "start_dt"
    t.date     "end_dt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rfx_sourcing_types", force: :cascade do |t|
    t.string   "rfx_id"
    t.integer  "sourcing_type_id"
    t.integer  "is_self"
    t.integer  "is_invite"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "rfx_vendors", force: :cascade do |t|
    t.string   "rfx_id"
    t.integer  "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rfxes", force: :cascade do |t|
    t.string   "SN"
    t.date     "begin_dt"
    t.date     "end_dt"
    t.integer  "sourcing_org_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "status"
    t.string   "title"
    t.integer  "price_visibility"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sourcing_orgs", force: :cascade do |t|
    t.string   "code"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sourcing_types", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_role_mappings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "vendor_rfx_items", force: :cascade do |t|
    t.integer  "vendor_id"
    t.integer  "rfx_item_id"
    t.float    "unit_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "rfx_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "string"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
