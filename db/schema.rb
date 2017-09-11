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

ActiveRecord::Schema.define(version: 20170911221011) do

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
    t.index ["account_id"], name: "index_orders_on_account_id"
    t.index ["order_hash"], name: "index_orders_on_order_hash"
    t.index ["order_type"], name: "index_orders_on_order_type"
    t.index ["status"], name: "index_orders_on_status"
    t.index ["user_id"], name: "index_orders_on_user_id"
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
    t.index ["rank"], name: "index_users_on_rank"
    t.index ["username"], name: "index_users_on_username"
  end

end
