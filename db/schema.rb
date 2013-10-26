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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131025002514) do

  create_table "donations", :force => true do |t|
    t.string   "donor_firstname"
    t.string   "donor_lastname"
    t.string   "donor_email"
    t.string   "acrename"
    t.string   "gift_sender_name"
    t.string   "recipient_firstname"
    t.string   "recipient_lastname"
    t.string   "recipient_email"
    t.string   "message"
    t.string   "parcel"
    t.string   "gift"
    t.integer  "numberofacres"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "parcels", :force => true do |t|
    t.string   "title"
    t.string   "icon"
    t.text     "description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "imagename"
    t.text     "short_description"
  end

end
