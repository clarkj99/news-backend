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

ActiveRecord::Schema.define(version: 2019_12_04_031101) do

  create_table "articles", force: :cascade do |t|
    t.string "source"
    t.string "source_name"
    t.string "author"
    t.string "title"
    t.string "description"
    t.string "url"
    t.string "url_to_image"
    t.datetime "published_at"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id"
    t.integer "country_id"
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["country_id"], name: "index_articles_on_country_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "code"
    t.string "name"
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "countries"
end
