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

ActiveRecord::Schema.define(version: 20180715224155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "game_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer "score"
    t.integer "game_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id"
    t.index ["game_id"], name: "index_reviews_on_game_id"
  end

  create_table "reviews_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "review_id", null: false
    t.index ["review_id", "tag_id"], name: "index_reviews_tags_on_review_id_and_tag_id"
    t.index ["tag_id", "review_id"], name: "index_reviews_tags_on_tag_id_and_review_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_reviews_joins", force: :cascade do |t|
    t.bigint "tags_id"
    t.bigint "reviews_id"
    t.index ["reviews_id"], name: "index_tags_reviews_joins_on_reviews_id"
    t.index ["tags_id"], name: "index_tags_reviews_joins_on_tags_id"
  end

  add_foreign_key "reviews", "games"
end
