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

ActiveRecord::Schema[7.0].define(version: 20_230_626_060_839) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'dishes', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'ingredients', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'dishes_menus', id: false, force: :cascade do |t|
    t.bigint 'dish_id', null: false
    t.bigint 'menu_id', null: false
    t.index %w[dish_id menu_id], name: 'index_dishes_menus_on_dish_id_and_menu_id'
    t.index %w[menu_id dish_id], name: 'index_dishes_menus_on_menu_id_and_dish_id'
  end

  create_table 'meal_attendances', force: :cascade do |t|
    t.integer 'meal_type', null: false
    t.date 'meal_date', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_meal_attendances_on_user_id'
  end

  create_table 'menus', force: :cascade do |t|
    t.integer 'meal_type', null: false
    t.date 'meal_date', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_menus_on_user_id'
  end

  create_table 'notices', force: :cascade do |t|
    t.text 'notice_title'
    t.text 'notice_body', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_notices_on_user_id'
  end

  create_table 'preferences', force: :cascade do |t|
    t.string 'restricted_food', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_preferences_on_user_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.text 'review_body', null: false
    t.integer 'rating', null: false
    t.bigint 'user_id', null: false
    t.bigint 'menu_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['menu_id'], name: 'index_reviews_on_menu_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'email', null: false
    t.string 'phone', null: false
    t.integer 'role', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'meal_attendances', 'users'
  add_foreign_key 'menus', 'users'
  add_foreign_key 'notices', 'users'
  add_foreign_key 'preferences', 'users'
  add_foreign_key 'reviews', 'menus'
  add_foreign_key 'reviews', 'users'
end
