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

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "article_classifications", force: :cascade do |t|
    t.integer "article_id"
    t.integer "category_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "borndate"
    t.string "email"
    t.string "mobile"
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["borndate"], name: "index_users_on_borndate"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mobile"], name: "index_users_on_mobile", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "article_classifications", "articles"
  add_foreign_key "article_classifications", "categories"
  add_foreign_key "articles", "users"
end
