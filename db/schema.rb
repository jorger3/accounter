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

ActiveRecord::Schema.define(version: 20171125032531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.string "bill_code"
    t.datetime "emition_date"
    t.datetime "expire_date"
    t.boolean "paid"
    t.integer "total"
    t.bigint "profile_id"
    t.bigint "property_id"
    t.bigint "company_id"
    t.bigint "bill_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_type_id"], name: "index_bills_on_bill_type_id"
    t.index ["company_id"], name: "index_bills_on_company_id"
    t.index ["profile_id"], name: "index_bills_on_profile_id"
    t.index ["property_id"], name: "index_bills_on_property_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.string "country"
    t.string "city"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "files", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_files_on_bill_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "rut"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "rut"
    t.string "country"
    t.string "city"
    t.string "address"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_properties_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
