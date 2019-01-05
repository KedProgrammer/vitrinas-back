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

ActiveRecord::Schema.define(version: 2018_12_03_212242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.date "date_expense"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "purchase_id"
    t.index ["category_id"], name: "index_expenses_on_category_id"
    t.index ["purchase_id"], name: "index_expenses_on_purchase_id"
  end

  create_table "fees", force: :cascade do |t|
    t.decimal "value"
    t.string "capital_payment"
    t.string "decimal"
    t.decimal "interes_rate"
    t.decimal "balance"
    t.integer "fee_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "loan_id"
    t.index ["loan_id"], name: "index_fees_on_loan_id"
  end

  create_table "loans", force: :cascade do |t|
    t.decimal "amount", default: "0.0"
    t.decimal "interes_rate", precision: 10, scale: 2, default: "0.0"
    t.decimal "remaining_payment", default: "0.0"
    t.decimal "paid_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_loans_on_employee_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "initial_date"
    t.bigint "bill_number"
    t.text "comments"
    t.string "aasm_state"
    t.string "client_name"
    t.bigint "client_number"
    t.bigint "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "place"
    t.date "delivery_date"
    t.string "seller_name"
    t.text "description"
  end

  create_table "purchases", id: :serial, force: :cascade do |t|
    t.string "name_purchases"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "expenses", "categories"
  add_foreign_key "expenses", "purchases"
  add_foreign_key "fees", "loans"
  add_foreign_key "loans", "employees"
end
