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

ActiveRecord::Schema.define(version: 20150811024908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "card_decks", force: :cascade do |t|
    t.integer  "deck_id"
    t.integer  "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_decks", ["card_id"], name: "index_card_decks_on_card_id", using: :btree
  add_index "card_decks", ["deck_id"], name: "index_card_decks_on_deck_id", using: :btree

  create_table "card_types", force: :cascade do |t|
    t.integer "card_id"
    t.integer "type_id"
  end

  add_index "card_types", ["card_id"], name: "index_card_types_on_card_id", using: :btree
  add_index "card_types", ["type_id"], name: "index_card_types_on_type_id", using: :btree

  create_table "cards", force: :cascade do |t|
    t.string   "set"
    t.integer  "number"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "mana_cost"
    t.integer  "cmc"
    t.string   "image_name"
  end

  add_index "cards", ["number", "set"], name: "index_cards_on_number_and_set", unique: true, using: :btree

  create_table "decks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
  end

  add_index "decks", ["user_id"], name: "index_decks_on_user_id", using: :btree

  create_table "drafts", force: :cascade do |t|
  end

  create_table "matches", force: :cascade do |t|
    t.integer "draft_id"
    t.integer "round_id"
    t.integer "player_one_id"
    t.integer "player_two_id"
    t.boolean "completed"
    t.integer "player_one_wins"
    t.integer "player_two_wins"
    t.integer "draws"
  end

  add_index "matches", ["draft_id"], name: "index_matches_on_draft_id", using: :btree
  add_index "matches", ["round_id"], name: "index_matches_on_round_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string  "name"
    t.integer "draft_id"
    t.integer "first_round_wins"
    t.integer "first_round_losses"
    t.integer "second_round_wins"
    t.integer "second_round_losses"
    t.integer "third_round_wins"
    t.integer "third_round_losses"
  end

  add_index "players", ["draft_id"], name: "index_players_on_draft_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.integer "draft_id"
    t.integer "number"
  end

  add_index "rounds", ["draft_id"], name: "index_rounds_on_draft_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "draft_id"
  end

  add_index "users", ["draft_id"], name: "index_users_on_draft_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "card_decks", "cards"
  add_foreign_key "card_decks", "decks"
  add_foreign_key "card_types", "cards"
  add_foreign_key "card_types", "types"
  add_foreign_key "decks", "users"
  add_foreign_key "matches", "drafts"
  add_foreign_key "matches", "players", column: "player_one_id"
  add_foreign_key "matches", "players", column: "player_two_id"
  add_foreign_key "matches", "rounds"
  add_foreign_key "players", "drafts"
  add_foreign_key "rounds", "drafts"
  add_foreign_key "users", "drafts"
end
