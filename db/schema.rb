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

ActiveRecord::Schema[7.0].define(version: 2022_07_26_012320) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "taggables", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "tag_id", null: false
    t.index ["tag_id"], name: "index_taggables_on_tag_id"
    t.index ["task_id"], name: "index_taggables_on_task_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "title", null: false
    t.string "status", default: "to_do"
    t.integer "level"
    t.datetime "deadline"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at", default: "2022-07-29 00:52:41"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "taggables", "tags"
  add_foreign_key "taggables", "tasks"
  add_foreign_key "tags", "users"
  add_foreign_key "tasks", "users"
end
