# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_06_000435) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "benefits_apps", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "phone_number"
    t.string "email_address"
    t.datetime "date_of_submission"
    t.boolean "has_income"
  end

  create_table "incomes", force: :cascade do |t|
    t.string "income"
    t.integer "total_income"
    t.bigint "benefits_app_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pay_period"
    t.index ["benefits_app_id"], name: "index_incomes_on_benefits_app_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "primary_member"
    t.boolean "secondary_member"
    t.bigint "benefits_app_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "birthdate"
    t.string "ssn"
    t.index ["benefits_app_id"], name: "index_members_on_benefits_app_id"
  end

  add_foreign_key "incomes", "benefits_apps"
  add_foreign_key "members", "benefits_apps"
end
