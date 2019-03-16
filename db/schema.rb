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

ActiveRecord::Schema.define(version: 2019_03_13_084750) do

  create_table "bank_accounts", force: :cascade do |t|
    t.string "bank_name"
    t.integer "bank_code"
    t.string "branch_name"
    t.integer "branch_code"
    t.string "bank_type"
    t.string "bank_holder"
    t.integer "bank_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_hash_tags", force: :cascade do |t|
    t.integer "book_id"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "prologue"
    t.string "bookCover"
    t.boolean "progress"
    t.string "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nices", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "category"
    t.string "eyecatch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "points", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comment_id"
    t.integer "usePoint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_hash_tags", force: :cascade do |t|
    t.integer "post_id"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "text"
    t.string "image1"
    t.string "image2"
    t.string "image3"
    t.float "longitude"
    t.float "latitude"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "follower_id"
    t.integer "followerd_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "introduction"
    t.string "email"
    t.string "password_digest"
    t.integer "points"
    t.string "weblink"
    t.string "thaksImage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "withdrawals", force: :cascade do |t|
    t.integer "user_id"
    t.integer "withdrawal_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
