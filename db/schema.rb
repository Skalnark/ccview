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

ActiveRecord::Schema.define(version: 20180317222915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "text"
    t.boolean "value"
    t.text "auxAnswer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "case_modules", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "case_picture_relationships", force: :cascade do |t|
    t.bigint "picture_id"
    t.bigint "clinical_cases_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinical_cases_id"], name: "index_case_picture_relationships_on_clinical_cases_id"
    t.index ["picture_id"], name: "index_case_picture_relationships_on_picture_id"
  end

  create_table "class_module_relationships", force: :cascade do |t|
    t.bigint "student_classes_id"
    t.bigint "case_modules_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_modules_id"], name: "index_class_module_relationships_on_case_modules_id"
    t.index ["student_classes_id"], name: "index_class_module_relationships_on_student_classes_id"
  end

  create_table "clinical_cases", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "auxText"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "institution"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "imagePath"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professor_module_relationships", force: :cascade do |t|
    t.bigint "case_modules_id"
    t.bigint "professors_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_modules_id"], name: "index_professor_module_relationships_on_case_modules_id"
    t.index ["professors_id"], name: "index_professor_module_relationships_on_professors_id"
  end

  create_table "professors", force: :cascade do |t|
    t.bigint "person_id"
    t.string "field"
    t.string "formation"
    t.string "degree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_professors_on_person_id"
  end

  create_table "question_answer_relationships", force: :cascade do |t|
    t.bigint "answer_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_question_answer_relationships_on_answer_id"
    t.index ["question_id"], name: "index_question_answer_relationships_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "clinical_cases_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinical_cases_id"], name: "index_questions_on_clinical_cases_id"
  end

  create_table "student_class_relationships", force: :cascade do |t|
    t.bigint "student_classes_id"
    t.bigint "students_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_classes_id"], name: "index_student_class_relationships_on_student_classes_id"
    t.index ["students_id"], name: "index_student_class_relationships_on_students_id"
  end

  create_table "student_classes", force: :cascade do |t|
    t.bigint "professor_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professor_id"], name: "index_student_classes_on_professor_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "person_id"
    t.string "curse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_students_on_person_id"
  end

  add_foreign_key "case_picture_relationships", "clinical_cases", column: "clinical_cases_id"
  add_foreign_key "case_picture_relationships", "pictures"
  add_foreign_key "class_module_relationships", "case_modules", column: "case_modules_id"
  add_foreign_key "class_module_relationships", "student_classes", column: "student_classes_id"
  add_foreign_key "professor_module_relationships", "case_modules", column: "case_modules_id"
  add_foreign_key "professor_module_relationships", "professors", column: "professors_id"
  add_foreign_key "professors", "people"
  add_foreign_key "question_answer_relationships", "answers"
  add_foreign_key "question_answer_relationships", "questions"
  add_foreign_key "questions", "clinical_cases", column: "clinical_cases_id"
  add_foreign_key "student_class_relationships", "student_classes", column: "student_classes_id"
  add_foreign_key "student_class_relationships", "students", column: "students_id"
  add_foreign_key "student_classes", "professors"
  add_foreign_key "students", "people"
end
