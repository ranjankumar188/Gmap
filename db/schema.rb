# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080710044243) do

  create_table "churches", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.string   "phone"
    t.string   "denomination_id"
    t.string   "url"
    t.string   "lat"
    t.string   "lng"
    t.integer  "created_by",      :limit => 11
    t.integer  "updated_by",      :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "denominations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "church_id",   :limit => 11
    t.string   "title"
    t.string   "repete_on"
    t.string   "description"
    t.time     "start_at"
    t.time     "end_at"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "recurring",                 :default => true
    t.integer  "created_by",  :limit => 11
    t.integer  "updated_by",  :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.integer  "church_id",  :limit => 11
    t.string   "title"
    t.string   "repete_on"
    t.time     "start_at"
    t.time     "end_at"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "recurring",                :default => true
    t.integer  "created_by", :limit => 11
    t.integer  "updated_by", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
