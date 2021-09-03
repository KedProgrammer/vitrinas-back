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

ActiveRecord::Schema.define(version: 2021_08_03_030048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "email_logs", force: :cascade do |t|
    t.string "sent_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "loan_id"
    t.date "initial_date", default: "2020-08-15", null: false
    t.string "email", default: "", null: false
    t.string "cellphone", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "identification", default: "", null: false
    t.string "job_position", default: "", null: false
    t.index ["loan_id"], name: "index_employees_on_loan_id"
  end

  create_table "fees", force: :cascade do |t|
    t.decimal "value"
    t.decimal "interest_amount"
    t.decimal "balance", precision: 20, scale: 10
    t.integer "fee_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "loan_id"
    t.integer "status", default: 0, null: false
    t.decimal "capital_payment", precision: 15, scale: 9
    t.date "payment_date"
    t.index ["loan_id"], name: "index_fees_on_loan_id"
  end

  create_table "loans", force: :cascade do |t|
    t.decimal "amount", default: "0.0"
    t.decimal "interest_rate", precision: 10, scale: 8, default: "0.0"
    t.decimal "remaining_payment", default: "0.0"
    t.decimal "paid_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id"
    t.integer "period_number"
    t.integer "period_type"
    t.decimal "fee_value", default: "0.0", null: false
    t.bigint "total_payed"
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
    t.datetime "delivery_date"
    t.string "seller_name"
    t.text "description"
    t.integer "order_number"
  end

  create_table "product_row_materials", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "row_material_id"
    t.decimal "quantity", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_row_materials_on_product_id"
    t.index ["row_material_id"], name: "index_product_row_materials_on_row_material_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.decimal "cost"
    t.integer "category_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "row_material_summary"
    t.decimal "profit_rate"
    t.decimal "price"
    t.string "image"
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

  create_table "row_materials", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_row_material_id"
    t.string "unity"
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "employees", "loans"
  add_foreign_key "fees", "loans"
  add_foreign_key "loans", "employees"
  add_foreign_key "product_row_materials", "products"
end
