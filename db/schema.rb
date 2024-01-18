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

ActiveRecord::Schema[7.1].define(version: 2024_01_02_082855) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "genre"
    t.string "duration"
    t.datetime "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies_theatres", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "theatre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movies_theatres_on_movie_id"
    t.index ["theatre_id"], name: "index_movies_theatres_on_theatre_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "seat_id", null: false
    t.integer "show_id", null: false
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seat_id"], name: "index_payments_on_seat_id"
    t.index ["show_id"], name: "index_payments_on_show_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "row"
    t.integer "number"
    t.integer "show_id", null: false
    t.integer "theatre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_seats_on_show_id"
    t.index ["theatre_id"], name: "index_seats_on_theatre_id"
  end

  create_table "shows", force: :cascade do |t|
    t.integer "theatre_id", null: false
    t.date "date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.index ["theatre_id"], name: "index_shows_on_theatre_id"
  end

  create_table "theatres", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "user_email"
    t.integer "user_number"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_customer_id"
  end

  add_foreign_key "movies_theatres", "movies"
  add_foreign_key "movies_theatres", "theatres"
  add_foreign_key "payments", "seats"
  add_foreign_key "payments", "shows"
  add_foreign_key "payments", "users"
  add_foreign_key "seats", "shows"
  add_foreign_key "seats", "theatres"
  add_foreign_key "shows", "theatres"
end
