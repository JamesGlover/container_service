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

ActiveRecord::Schema.define(version: 20160505153148) do

  create_table "labware_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "layout_id"
    t.index ["layout_id"], name: "index_labware_types_on_layout_id", using: :btree
  end

  create_table "labwares", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "barcode"
    t.string   "external_id"
    t.string   "uuid"
    t.integer  "labware_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["barcode"], name: "index_labwares_on_barcode", using: :btree
    t.index ["external_id"], name: "index_labwares_on_external_id", using: :btree
    t.index ["labware_type_id"], name: "index_labwares_on_labware_type_id", using: :btree
    t.index ["uuid"], name: "index_labwares_on_uuid", using: :btree
  end

  create_table "layouts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "layout_id"
    t.index ["layout_id"], name: "index_locations_on_layout_id", using: :btree
  end

  create_table "metadata", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "labware_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key", "labware_id"], name: "index_metadata_on_key_and_labware_id", unique: true, using: :btree
    t.index ["labware_id"], name: "index_metadata_on_labware_id", using: :btree
  end

  create_table "receptacles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "labware_id"
    t.integer  "location_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "material_uuid"
    t.index ["labware_id"], name: "index_receptacles_on_labware_id", using: :btree
    t.index ["location_id"], name: "index_receptacles_on_location_id", using: :btree
  end

  add_foreign_key "labware_types", "layouts"
  add_foreign_key "locations", "layouts"
  add_foreign_key "metadata", "labwares"
  add_foreign_key "receptacles", "labwares"
  add_foreign_key "receptacles", "locations"
end
