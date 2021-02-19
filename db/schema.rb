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

ActiveRecord::Schema.define(version: 2021_02_19_092409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.string "bank_name"
    t.float "interest_rate"
    t.decimal "maximum_loan"
    t.float "minimum_down_payment"
    t.integer "loan_term"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "calculations", force: :cascade do |t|
    t.decimal "initial_loan"
    t.decimal "down_payment"
    t.bigint "bank_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bank_id", "updated_at"], name: "index_calculations_on_bank_id_and_updated_at"
    t.index ["bank_id"], name: "index_calculations_on_bank_id"
  end

  add_foreign_key "calculations", "banks"
end
