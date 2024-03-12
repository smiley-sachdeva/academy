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

ActiveRecord::Schema.define(version: 2024_03_12_170222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_authors", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_course_authors_on_author_id"
    t.index ["course_id", "author_id"], name: "index_course_authors_on_course_id_and_author_id", unique: true
    t.index ["course_id"], name: "index_course_authors_on_course_id"
  end

  create_table "course_learning_paths", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "learning_path_id"
    t.integer "sequence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id", "learning_path_id", "sequence"], name: "unique_sequence", unique: true
    t.index ["course_id", "learning_path_id"], name: "index_course_learning_paths_on_course_id_and_learning_path_id", unique: true
    t.index ["course_id"], name: "index_course_learning_paths_on_course_id"
    t.index ["learning_path_id"], name: "index_course_learning_paths_on_learning_path_id"
  end

  create_table "course_talent_enrollments", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "talent_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "talent_learning_path_enrollment_id", null: false
    t.index ["course_id"], name: "index_course_talent_enrollments_on_course_id"
    t.index ["talent_id"], name: "index_course_talent_enrollments_on_talent_id"
    t.index ["talent_learning_path_enrollment_id"], name: "course_talents"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "learning_paths", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "talent_learning_path_enrollments", force: :cascade do |t|
    t.bigint "learning_path_id"
    t.bigint "talent_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["learning_path_id"], name: "index_talent_learning_path_enrollments_on_learning_path_id"
    t.index ["talent_id"], name: "index_talent_learning_path_enrollments_on_talent_id"
  end

  create_table "talents", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "course_authors", "courses"
  add_foreign_key "course_authors", "talents", column: "author_id"
  add_foreign_key "course_learning_paths", "courses"
  add_foreign_key "course_learning_paths", "learning_paths"
  add_foreign_key "course_talent_enrollments", "courses"
  add_foreign_key "course_talent_enrollments", "talent_learning_path_enrollments"
  add_foreign_key "course_talent_enrollments", "talents"
  add_foreign_key "talent_learning_path_enrollments", "learning_paths"
  add_foreign_key "talent_learning_path_enrollments", "talents"
end
