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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121126062208) do

  create_table "codes", :force => true do |t|
    t.string   "author",     :null => false
    t.string   "page"
    t.string   "email",      :null => false
    t.string   "password",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "code_id",    :null => false
    t.string   "email",      :null => false
    t.string   "nick",       :null => false
    t.string   "page"
    t.text     "content",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "snippets", :force => true do |t|
    t.integer  "code_id",                    :null => false
    t.string   "description",                :null => false
    t.string   "language",                   :null => false
    t.string   "name",                       :null => false
    t.integer  "version",     :default => 1, :null => false
    t.text     "source",                     :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

end
