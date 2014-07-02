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

ActiveRecord::Schema.define(version: 20140701124823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "subdomain"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.string   "tel"
    t.string   "email"
    t.string   "reg_no"
    t.string   "vat_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "latitude",   limit: nil
    t.string   "longitude",  limit: nil
    t.string   "logo",       limit: nil
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree
  add_index "companies", ["subdomain"], name: "index_companies_on_subdomain", unique: true, using: :btree

  create_table "mjweb_abouts", force: true do |t|
    t.integer  "company_id"
    t.string   "title"
    t.text     "text"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_backgrounds", force: true do |t|
    t.string   "name"
    t.string   "background"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_contents", force: true do |t|
    t.integer  "company_id"
    t.integer  "tile_id"
    t.string   "display"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_designs", force: true do |t|
    t.integer  "company_id",                           null: false
    t.string   "tile_colour", default: "#572c73",      null: false
    t.string   "background",  default: "background",   null: false
    t.string   "font",        default: "Marck Script", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_details", force: true do |t|
    t.string   "tagline"
    t.integer  "ecommerce"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "googleplus"
    t.string   "linkedin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "mjweb_fonts", force: true do |t|
    t.string   "name"
    t.string   "style"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_hours", force: true do |t|
    t.integer  "company_id"
    t.integer  "monday_status",    default: 1
    t.datetime "monday_open",      default: '2000-01-01 09:30:00'
    t.datetime "monday_close",     default: '2000-01-01 17:30:00'
    t.integer  "tuesday_status",   default: 1
    t.datetime "tuesday_open",     default: '2000-01-01 09:30:00'
    t.datetime "tuesday_close",    default: '2000-01-01 17:30:00'
    t.integer  "wednesday_status", default: 1
    t.datetime "wednesday_open",   default: '2000-01-01 09:30:00'
    t.datetime "wednesday_close",  default: '2000-01-01 17:30:00'
    t.integer  "thursday_status",  default: 1
    t.datetime "thursday_open",    default: '2000-01-01 09:30:00'
    t.datetime "thursday_close",   default: '2000-01-01 17:30:00'
    t.integer  "friday_status",    default: 1
    t.datetime "friday_open",      default: '2000-01-01 09:30:00'
    t.datetime "friday_close",     default: '2000-01-01 17:30:00'
    t.integer  "saturday_status",  default: 1
    t.datetime "saturday_open",    default: '2000-01-01 09:30:00'
    t.datetime "saturday_close",   default: '2000-01-01 17:30:00'
    t.integer  "sunday_status",    default: 1
    t.datetime "sunday_open",      default: '2000-01-01 11:00:00'
    t.datetime "sunday_close",     default: '2000-01-01 16:30:00'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_images", force: true do |t|
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: nil
    t.string   "image",      limit: nil
  end

  create_table "mjweb_imagesettings", force: true do |t|
    t.integer  "image_id"
    t.integer  "content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_services", force: true do |t|
    t.integer  "company_id"
    t.string   "title"
    t.text     "text"
    t.string   "link"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_settings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_tiles", force: true do |t|
    t.string   "name"
    t.string   "partial_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "surname"
    t.string   "tel"
    t.integer  "company_id"
    t.integer  "role",                   default: 0
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
