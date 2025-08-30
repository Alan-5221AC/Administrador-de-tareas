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

ActiveRecord::Schema.define(version: 2025_06_20_030848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asistencias", force: :cascade do |t|
    t.bigint "user_id"
    t.date "fecha", null: false
    t.time "hora_entrada", null: false
    t.time "hora_salida", null: false
    t.text "observaciones"
    t.integer "modalidad", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_asistencias_on_user_id"
  end

  create_table "tareas", force: :cascade do |t|
    t.string "titulo"
    t.text "descripcion"
    t.integer "prioridad", default: 0
    t.string "PersonaAsignada"
    t.date "fecha_limite"
    t.boolean "completada", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "descripcion_completado"
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "apellidos"
    t.string "encrypted_password", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.integer "role", default: 0
    t.string "numero_control", default: "", null: false
    t.time "hora_entrada"
    t.time "hora_salida"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "puesto"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "asistencias", "users"
end
