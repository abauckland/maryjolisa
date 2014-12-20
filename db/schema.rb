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

ActiveRecord::Schema.define(version: 20141204123386) do

  create_table "companies", force: true do |t|
    t.string   "name",                         null: false
    t.string   "subdomain",                    null: false
    t.string   "domain",                       null: false
    t.string   "logo"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "tel"
    t.string   "alt_tel"
    t.string   "email"
    t.string   "reg_no"
    t.string   "vat_no"
    t.integer  "plan",             default: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "retail_subdomain"
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree
  add_index "companies", ["retail_subdomain"], name: "index_companies_on_retail_subdomain", using: :btree

  create_table "helps", force: true do |t|
    t.string   "item"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_companyaccounts", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "provider"
    t.string   "code"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_customers", force: true do |t|
    t.integer  "company_id"
    t.string   "title"
    t.string   "first_name"
    t.string   "surname"
    t.string   "position"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "county"
    t.string   "country"
    t.string   "postcode"
    t.string   "phone"
    t.string   "alt_phone"
    t.string   "email"
    t.string   "company_name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_expenditems", force: true do |t|
    t.integer  "expend_id"
    t.integer  "expense_id"
    t.integer  "salary_id"
    t.integer  "transfer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_expends", force: true do |t|
    t.integer  "exp_type"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "paymethod_id"
    t.integer  "companyaccount_id"
    t.string   "expend_receipt"
    t.datetime "date"
    t.string   "ref"
    t.decimal  "price",             precision: 8, scale: 2, default: 0.0
    t.decimal  "vat",               precision: 8, scale: 2, default: 0.0
    t.decimal  "total",             precision: 8, scale: 2, default: 0.0
    t.text     "note"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_expenses", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "exp_type"
    t.integer  "project_id"
    t.integer  "supplier_id"
    t.integer  "hmrcexpcat_id"
    t.integer  "mileage_id"
    t.datetime "date"
    t.datetime "due_date"
    t.decimal  "price",         precision: 8, scale: 2
    t.decimal  "vat",           precision: 8, scale: 2
    t.decimal  "total",         precision: 8, scale: 2
    t.string   "receipt"
    t.integer  "recurrence"
    t.string   "ref"
    t.string   "supplier_ref"
    t.integer  "state"
    t.integer  "expend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_hmrcexpcats", force: true do |t|
    t.integer  "company_id"
    t.string   "category"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_hmrcgroups", force: true do |t|
    t.string   "group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_ingroups", force: true do |t|
    t.integer  "invoice_id"
    t.string   "ref"
    t.string   "text"
    t.decimal  "price",       precision: 8, scale: 2, default: 0.0
    t.decimal  "vat_due",     precision: 8, scale: 2, default: 0.0
    t.decimal  "total",       precision: 8, scale: 2, default: 0.0
    t.integer  "group_order",                         default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_inlines", force: true do |t|
    t.integer  "ingroup_id"
    t.string   "cat",                                default: "Select category"
    t.string   "item",                               default: "Select item"
    t.decimal  "quantity",   precision: 8, scale: 0, default: 0
    t.integer  "unit_id",                            default: 1
    t.decimal  "rate",       precision: 8, scale: 2, default: 0.0
    t.decimal  "price",      precision: 8, scale: 2, default: 0.0
    t.integer  "vat_id",                             default: 1
    t.decimal  "vat_due",    precision: 8, scale: 2, default: 0.0
    t.decimal  "total",      precision: 8, scale: 2, default: 0.0
    t.text     "note"
    t.integer  "line_order",                         default: 1
    t.integer  "linetype",                           default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_invoicemethods", force: true do |t|
    t.string   "method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_invoices", force: true do |t|
    t.integer  "project_id"
    t.string   "ref"
    t.string   "customer_ref"
    t.decimal  "price",          precision: 8, scale: 2, default: 0.0
    t.decimal  "vat_due",        precision: 8, scale: 2, default: 0.0
    t.decimal  "total",          precision: 8, scale: 2, default: 0.0
    t.integer  "state"
    t.datetime "date"
    t.integer  "invoiceterm_id"
    t.integer  "invoicetype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_invoiceterms", force: true do |t|
    t.integer  "company_id"
    t.string   "ref"
    t.integer  "period"
    t.text     "terms"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_invoicetypes", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_mileagemodes", force: true do |t|
    t.integer  "company_id"
    t.string   "mode"
    t.decimal  "rate",       precision: 8, scale: 2
    t.decimal  "hmrc_rate",  precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_mileages", force: true do |t|
    t.integer  "project_id"
    t.integer  "mileagemode_id"
    t.integer  "user_id"
    t.integer  "hmrcexpcat_id"
    t.string   "start"
    t.string   "finish"
    t.integer  "return"
    t.decimal  "distance",       precision: 4, scale: 0
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_payments", force: true do |t|
    t.integer  "user_id"
    t.integer  "invoice_id"
    t.integer  "project_id"
    t.integer  "paymethod_id"
    t.integer  "companyaccount_id"
    t.decimal  "price",             precision: 8, scale: 2, default: 0.0
    t.decimal  "vat",               precision: 8, scale: 2, default: 0.0
    t.decimal  "total",             precision: 8, scale: 2, default: 0.0
    t.datetime "date"
    t.text     "note"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_paymethods", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_productcategories", force: true do |t|
    t.integer  "company_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_products", force: true do |t|
    t.integer  "company_id"
    t.integer  "productcategory_id"
    t.string   "item"
    t.decimal  "quantity",           precision: 8, scale: 0
    t.integer  "unit_id"
    t.decimal  "rate",               precision: 8, scale: 2
    t.decimal  "price",              precision: 8, scale: 2
    t.integer  "vat_id"
    t.decimal  "vat_due",            precision: 8, scale: 2
    t.decimal  "total",              precision: 8, scale: 2
    t.integer  "linetype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_projects", force: true do |t|
    t.integer  "company_id"
    t.string   "ref"
    t.string   "title"
    t.integer  "customer_id"
    t.text     "description"
    t.integer  "invoicemethod_id"
    t.string   "customer_ref"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_qgroups", force: true do |t|
    t.integer  "quote_id"
    t.integer  "ref",                                 default: 1
    t.integer  "group_order",                         default: 1
    t.string   "text",                                default: "Please add brief description of work"
    t.decimal  "price",       precision: 8, scale: 2, default: 0.0
    t.decimal  "vat_due",     precision: 8, scale: 2, default: 0.0
    t.decimal  "total",       precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_qlines", force: true do |t|
    t.integer  "qgroup_id"
    t.string   "cat",                                default: "Select category"
    t.string   "item",                               default: "Select item"
    t.decimal  "quantity",   precision: 8, scale: 0, default: 0
    t.integer  "unit_id",                            default: 1
    t.decimal  "rate",       precision: 8, scale: 2, default: 0.0
    t.decimal  "price",      precision: 8, scale: 2, default: 0.0
    t.integer  "vat_id",                             default: 1
    t.decimal  "vat_due",    precision: 8, scale: 2, default: 0.0
    t.decimal  "total",      precision: 8, scale: 2, default: 0.0
    t.text     "note"
    t.integer  "linetype",                           default: 1
    t.integer  "line_order",                         default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_quotes", force: true do |t|
    t.integer  "project_id"
    t.string   "ref"
    t.string   "title"
    t.string   "customer_ref"
    t.datetime "date"
    t.integer  "state"
    t.integer  "quoteterm_id"
    t.decimal  "price",        precision: 8, scale: 2, default: 0.0
    t.decimal  "vat_due",      precision: 8, scale: 2, default: 0.0
    t.decimal  "total",        precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_quoteterms", force: true do |t|
    t.integer  "company_id"
    t.string   "ref"
    t.integer  "period"
    t.text     "terms"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_salaries", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.decimal  "total",      precision: 8, scale: 2, default: 0.0
    t.datetime "date"
    t.string   "state"
    t.integer  "expend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_suppliers", force: true do |t|
    t.integer  "company_id"
    t.string   "title"
    t.string   "first_name"
    t.string   "surname"
    t.string   "position"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "county"
    t.string   "country"
    t.string   "postcode"
    t.string   "phone"
    t.string   "alt_phone"
    t.string   "email"
    t.string   "company_name"
    t.text     "notes"
    t.string   "vat_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_transfers", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "account_from_id"
    t.integer  "account_to_id"
    t.integer  "paymethod_id"
    t.string   "total"
    t.datetime "date"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_units", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjbook_vats", force: true do |t|
    t.string   "cat"
    t.decimal  "rate",       precision: 3, scale: 1
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
    t.integer  "tile_ref"
    t.string   "display",    default: "All devices"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_designs", force: true do |t|
    t.integer  "company_id"
    t.string   "tile_colour",   default: "#572c73"
    t.string   "background_id", default: "1"
    t.string   "font_id",       default: "1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_details", force: true do |t|
    t.integer  "company_id"
    t.string   "tagline"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "googleplus"
    t.string   "linkedin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_events", force: true do |t|
    t.integer  "company_id"
    t.string   "topic"
    t.datetime "date"
    t.datetime "start"
    t.datetime "finish"
    t.string   "venue"
    t.string   "address"
    t.string   "postcode"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_fonts", force: true do |t|
    t.string   "name"
    t.string   "style"
    t.string   "font"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_hours", force: true do |t|
    t.integer  "company_id"
    t.string   "monday_status",    default: "Open"
    t.datetime "monday_open",      default: '2000-01-01 09:30:00'
    t.datetime "monday_close",     default: '2000-01-01 17:30:00'
    t.string   "tuesday_status",   default: "Open"
    t.datetime "tuesday_open",     default: '2000-01-01 09:30:00'
    t.datetime "tuesday_close",    default: '2000-01-01 17:30:00'
    t.string   "wednesday_status", default: "Open"
    t.datetime "wednesday_open",   default: '2000-01-01 09:30:00'
    t.datetime "wednesday_close",  default: '2000-01-01 17:30:00'
    t.string   "thursday_status",  default: "Open"
    t.datetime "thursday_open",    default: '2000-01-01 09:30:00'
    t.datetime "thursday_close",   default: '2000-01-01 17:30:00'
    t.string   "friday_status",    default: "Open"
    t.datetime "friday_open",      default: '2000-01-01 09:30:00'
    t.datetime "friday_close",     default: '2000-01-01 17:30:00'
    t.string   "saturday_status",  default: "Open"
    t.datetime "saturday_open",    default: '2000-01-01 09:30:00'
    t.datetime "saturday_close",   default: '2000-01-01 17:30:00'
    t.string   "sunday_status",    default: "Open"
    t.datetime "sunday_open",      default: '2000-01-01 11:00:00'
    t.datetime "sunday_close",     default: '2000-01-01 16:30:00'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_icons", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.string   "icon_black"
    t.string   "icon_white"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_images", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_imagesettings", force: true do |t|
    t.integer  "image_id"
    t.integer  "content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_infos", force: true do |t|
    t.integer  "order_ref"
    t.integer  "page_id"
    t.string   "title"
    t.text     "text"
    t.string   "link_text"
    t.string   "link_url"
    t.string   "link_page_id"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_linktiles", force: true do |t|
    t.integer  "content_id"
    t.string   "title"
    t.integer  "icon_id"
    t.integer  "page_id"
    t.string   "link_url"
    t.integer  "type_id",    default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_pages", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_tilelists", force: true do |t|
    t.integer  "linktile_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_tiles", force: true do |t|
    t.string   "name"
    t.string   "partial_name"
    t.integer  "group"
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
    t.string   "password_salt"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
