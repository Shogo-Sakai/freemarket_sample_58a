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

ActiveRecord::Schema.define(version: 2019_09_18_080813) do

  create_table "bigcategories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "category_indices_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_indices_id"], name: "index_bigcategories_on_category_indices_id"
  end

  create_table "category_indices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deploy_checks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "text", null: false
    t.integer "fresh_status_id", null: false
    t.integer "user_id"
    t.integer "sell_status_id", null: false
    t.integer "size_id"
    t.bigint "category_indices_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_indices_id"], name: "index_products_on_category_indices_id"
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smallcategories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "bigcategories_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bigcategories_id"], name: "index_smallcategories_on_bigcategories_id"
  end

  create_table "smallcategory_has_sizetables", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "smallcategories_id"
    t.bigint "sizes_id"
    t.index ["sizes_id"], name: "index_smallcategory_has_sizetables_on_sizes_id"
    t.index ["smallcategories_id"], name: "index_smallcategory_has_sizetables_on_smallcategories_id"
  end

  add_foreign_key "bigcategories", "category_indices", column: "category_indices_id"
  add_foreign_key "products", "category_indices", column: "category_indices_id"
  add_foreign_key "smallcategories", "bigcategories", column: "bigcategories_id"
  add_foreign_key "smallcategory_has_sizetables", "sizes", column: "sizes_id"
  add_foreign_key "smallcategory_has_sizetables", "smallcategories", column: "smallcategories_id"
end
