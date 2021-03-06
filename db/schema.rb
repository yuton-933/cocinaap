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

ActiveRecord::Schema.define(version: 2021_06_08_025840) do

  create_table "dishes", force: :cascade do |t|
    t.string "title", null: false
    t.integer "prep_time"
    t.integer "cook_time", null: false
    t.integer "sit_time"
    t.integer "yield", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "title", null: false
    t.float "protein", null: false
    t.float "fat", null: false
    t.float "carbs", null: false
    t.integer "cost", null: false
    t.boolean "allergen", default: false
    t.boolean "meat", default: false
    t.boolean "dairy_egg", default: false
    t.boolean "seafood", default: false
    t.boolean "other_animal", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients_in_dishes", force: :cascade do |t|
    t.integer "ingredient_id", null: false
    t.integer "dish_id", null: false
    t.string "unit", null: false
    t.float "gram", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_ingredients_in_dishes_on_dish_id"
    t.index ["ingredient_id"], name: "index_ingredients_in_dishes_on_ingredient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ingredients_in_dishes", "dishes"
  add_foreign_key "ingredients_in_dishes", "ingredients"
end
