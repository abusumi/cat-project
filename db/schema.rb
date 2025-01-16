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

ActiveRecord::Schema[7.2].define(version: 2025_01_15_175426) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_bookmarks_on_food_id"
    t.index ["user_id", "food_id"], name: "index_bookmarks_on_user_id_and_food_id", unique: true
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "weight"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cats_on_user_id"
  end

  create_table "feeding_calculations", force: :cascade do |t|
    t.bigint "cat_id", null: false
    t.bigint "main_food_id"
    t.bigint "sub_food_id"
    t.decimal "main_food_amount"
    t.decimal "sub_food_amount"
    t.float "total_daily_calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_feeding_calculations_on_brand_id"
    t.index ["cat_id"], name: "index_feeding_calculations_on_cat_id"
    t.index ["main_food_id"], name: "index_feeding_calculations_on_main_food_id"
    t.index ["sub_food_id"], name: "index_feeding_calculations_on_sub_food_id"
    t.index ["user_id"], name: "index_feeding_calculations_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.string "name"
    t.decimal "calories_per_gram"
    t.decimal "seventy"
    t.decimal "coefficient"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "external_url"
    t.index ["brand_id"], name: "index_foods_on_brand_id"
  end

  create_table "helpfuls", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_helpfuls_on_review_id"
    t.index ["user_id"], name: "index_helpfuls_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_id", null: false
    t.text "comment"
    t.index ["user_id", "food_id"], name: "index_reviews_on_user_id_and_food_id", unique: true
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "foods"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "cats", "users"
  add_foreign_key "feeding_calculations", "brands"
  add_foreign_key "feeding_calculations", "cats"
  add_foreign_key "feeding_calculations", "foods", column: "main_food_id"
  add_foreign_key "feeding_calculations", "foods", column: "sub_food_id"
  add_foreign_key "feeding_calculations", "users"
  add_foreign_key "foods", "brands"
  add_foreign_key "helpfuls", "reviews"
  add_foreign_key "helpfuls", "users"
  add_foreign_key "reviews", "foods"
  add_foreign_key "reviews", "users"
end
