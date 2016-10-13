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

ActiveRecord::Schema.define(version: 20161013135832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.text     "allergies"
    t.integer  "calories"
    t.text     "ingredients"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "restaurant_id"
    t.boolean  "highlight",          default: false
    t.string   "category"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["restaurant_id"], name: "index_dishes_on_restaurant_id", using: :btree
  end

  create_table "dishes_menus", id: false, force: :cascade do |t|
    t.integer "dish_id"
    t.integer "menu_id"
    t.index ["dish_id"], name: "index_dishes_menus_on_dish_id", using: :btree
    t.index ["menu_id"], name: "index_dishes_menus_on_menu_id", using: :btree
  end

  create_table "menus", force: :cascade do |t|
    t.string   "title",         default: "", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "restaurant_id"
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "street"
    t.integer  "zipcode"
    t.string   "town"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "category",    default: "Other"
    t.index ["user_id"], name: "index_restaurants_on_user_id", using: :btree
  end

  create_table "shopping_cart_items", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "user_id"
    t.string   "stripe_customer"
    t.boolean  "paid",            default: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "role",                   default: "customer", null: false
    t.string   "name",                                        null: false
    t.text     "address",                                     null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "provider",               default: "email",    null: false
    t.string   "uid",                    default: "",         null: false
    t.text     "tokens"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "dishes", "restaurants"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "restaurants", "users"
  add_foreign_key "shopping_carts", "users"
end
