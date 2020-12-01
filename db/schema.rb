# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_01_125652) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.integer "published_year"
    t.string "genre"
    t.text "description"
    t.integer "pages"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reading_list_books", force: :cascade do |t|
    t.integer "reading_list_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_reading_list_books_on_book_id"
    t.index ["reading_list_id"], name: "index_reading_list_books_on_reading_list_id"
  end

  create_table "reading_lists", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_reading_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "reading_list_books", "books"
  add_foreign_key "reading_list_books", "reading_lists"
  add_foreign_key "reading_lists", "users"
end
