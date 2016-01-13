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

ActiveRecord::Schema.define(version: 20160106182359) do

  create_table "company_accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "market"
    t.integer  "numerator"
    t.float    "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "company_account_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "bio"
  end

  add_index "staffs", ["company_account_id"], name: "index_staffs_on_company_account_id"
  add_index "staffs", ["user_id", "company_account_id", "created_at"], name: "index_staffs_on_user_id_and_company_account_id_and_created_at"
  add_index "staffs", ["user_id"], name: "index_staffs_on_user_id"

  create_table "transactions", force: :cascade do |t|
    t.text     "description"
    t.integer  "provider_id"
    t.integer  "customer_id"
    t.float    "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "transactions", ["provider_id", "customer_id"], name: "index_transactions_on_provider_id_and_customer_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",              default: false
    t.string   "activation_digest"
    t.boolean  "activated",          default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "company_account_id"
  end

  add_index "users", ["company_account_id", "created_at"], name: "index_users_on_company_account_id_and_created_at"
  add_index "users", ["company_account_id"], name: "index_users_on_company_account_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
