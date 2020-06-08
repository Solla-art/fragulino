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

ActiveRecord::Schema.define(version: 20200603212540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :bigserial, force: :cascade do |t|
    t.integer  "employee_id",            limit: 8
    t.text     "password"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.text     "email",                            default: "", null: false
    t.text     "encrypted_password",               default: "", null: false
    t.text     "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree

  create_table "departments", id: :bigserial, force: :cascade do |t|
    t.text     "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", id: :bigserial, force: :cascade do |t|
    t.text     "full_name"
    t.integer  "shop_id",       limit: 8
    t.integer  "department_id", limit: 8
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "items", id: :bigserial, force: :cascade do |t|
    t.text     "name"
    t.text     "descripton"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipt_items", id: :bigserial, force: :cascade do |t|
    t.integer  "receipt_id", limit: 8
    t.integer  "item_id",    limit: 8
    t.integer  "item_count", limit: 8
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "receipts", id: :bigserial, force: :cascade do |t|
    t.integer  "shop_id",     limit: 8
    t.integer  "employee_id", limit: 8
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "total"
  end

  create_table "shops", id: :bigserial, force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "employees"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "shops"
  add_foreign_key "receipt_items", "items"
  add_foreign_key "receipt_items", "receipts"
  add_foreign_key "receipts", "employees"
  add_foreign_key "receipts", "shops"
end
