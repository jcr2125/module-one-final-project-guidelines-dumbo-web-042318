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

ActiveRecord::Schema.define(version: 20180509162241) do

  create_table "languages", force: :cascade do |t|
    t.string "name"
  end

  create_table "repo_contrs", force: :cascade do |t|
    t.integer "repository_id"
    t.integer "contributor_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.string  "name"
    t.integer "owner_id"
    t.integer "language_id"
    t.string  "description"
    t.integer "forks"
    t.integer "watchers"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
