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

ActiveRecord::Schema.define(version: 2022_01_24_221458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "discord_name"
    t.integer "credits", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_type"
    t.string "account_hash"
    t.index ["account_hash"], name: "index_accounts_on_account_hash"
    t.index ["account_type"], name: "index_accounts_on_account_type"
    t.index ["name"], name: "index_accounts_on_name"
  end

  create_table "orders", force: :cascade do |t|
    t.string "description"
    t.string "order_hash"
    t.integer "account_id"
    t.integer "user_id"
    t.integer "order_type", default: 0
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "platform", default: 0
    t.integer "time_window", default: 0
    t.integer "order_quantity"
    t.text "order_commodity"
    t.integer "location", default: 0
    t.index ["account_id"], name: "index_orders_on_account_id"
    t.index ["order_hash"], name: "index_orders_on_order_hash"
    t.index ["order_type"], name: "index_orders_on_order_type"
    t.index ["platform"], name: "index_orders_on_platform"
    t.index ["status"], name: "index_orders_on_status"
    t.index ["time_window"], name: "index_orders_on_time_window"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.text "content", null: false
    t.integer "account_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_testimonials_on_account_id"
    t.index ["order_id"], name: "index_testimonials_on_order_id"
  end

  create_table "trade_events", force: :cascade do |t|
    t.text "content", null: false
    t.integer "user_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.index ["account_id"], name: "index_trade_events_on_account_id"
    t.index ["order_id"], name: "index_trade_events_on_order_id"
    t.index ["user_id"], name: "index_trade_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text "image_url"
    t.string "rank"
    t.string "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "password_digest"
    t.string "pw_salt"
    t.index ["admin"], name: "index_users_on_admin"
    t.index ["rank"], name: "index_users_on_rank"
    t.index ["username"], name: "index_users_on_username"
  end

end
