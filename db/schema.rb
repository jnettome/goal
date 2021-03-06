# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140128165811) do

  create_table "exercises", force: true do |t|
    t.integer  "training_id"
    t.string   "name"
    t.string   "repetitions"
    t.string   "series"
    t.string   "interval"
    t.string   "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exercises", ["training_id"], name: "index_exercises_on_training_id"

  create_table "form_parqs", force: true do |t|
    t.integer  "user_id"
    t.boolean  "answer1"
    t.boolean  "answer2"
    t.boolean  "answer3"
    t.boolean  "answer4"
    t.boolean  "answer5"
    t.boolean  "answer6"
    t.boolean  "answer7"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "form_parqs", ["user_id"], name: "index_form_parqs_on_user_id"

  create_table "teachers_students", force: true do |t|
    t.integer "teacher_id"
    t.integer "student_id"
  end

  add_index "teachers_students", ["student_id"], name: "index_teachers_students_on_student_id"
  add_index "teachers_students", ["teacher_id"], name: "index_teachers_students_on_teacher_id"

  create_table "trainings", force: true do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.text     "objective"
    t.string   "duration"
    t.text     "schedule"
    t.string   "body_group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trainings", ["teacher_id"], name: "index_trainings_on_teacher_id"

  create_table "users", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "name"
    t.string   "city"
    t.string   "document"
    t.string   "specialty"
    t.string   "state"
    t.text     "short_bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
