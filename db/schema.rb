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

ActiveRecord::Schema.define(version: 20180830161543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "disappearances", force: :cascade do |t|
    t.string "date"
    t.string "hour"
    t.bigint "disappeareds_id"
    t.string "email"
    t.integer "number_police_report"
    t.string "police_station"
    t.text "disappearance_history"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disappeareds_id"], name: "index_disappearances_on_disappeareds_id"
  end

  create_table "disappeareds", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.bigint "id_number"
    t.string "cpf"
    t.string "drivers_license"
    t.string "date_of_birth"
    t.integer "gender"
    t.string "nationality"
    t.string "state"
    t.integer "marital_status"
    t.string "address"
    t.string "telephone"
    t.bigint "relatives_id"
    t.string "cell_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "email"
    t.string "notification_face"
    t.string "encrypted_password"
    t.string "encrypted_password_iv"
    t.index ["relatives_id"], name: "index_disappeareds_on_relatives_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "relatives", force: :cascade do |t|
    t.string "relative_name"
    t.bigint "id_number"
    t.integer "relative_degree"
    t.string "telephone"
    t.string "email"
    t.string "cell_phone"
    t.string "address", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "disappearances", "disappeareds", column: "disappeareds_id"
  add_foreign_key "disappeareds", "relatives", column: "relatives_id"
end
