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

ActiveRecord::Schema.define(version: 2019_09_18_095533) do

  create_table "bigcategories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "category_index_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_index_id"], name: "index_bigcategories_on_category_index_id"
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_indices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "fee_person", null: false
    t.string "from_area", null: false
    t.integer "day_id", null: false
    t.integer "how_id", null: false
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_deliveries_on_product_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content", null: false
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "sell", null: false
    t.integer "fee", null: false
    t.integer "benefit", null: false
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_prices_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "text", null: false
    t.integer "fresh_status_id", null: false
    t.integer "user_id"
    t.integer "sell_status_id", null: false
    t.integer "size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.bigint "category_index_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_index_id"], name: "index_products_on_category_index_id"
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smallcategories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "bigcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bigcategory_id"], name: "index_smallcategories_on_bigcategory_id"
  end

  create_table "smallcategories_has_sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "smallcategory_id"
    t.bigint "size_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["size_id"], name: "index_smallcategories_has_sizes_on_size_id"
    t.index ["smallcategory_id"], name: "index_smallcategories_has_sizes_on_smallcategory_id"
  end

  add_foreign_key "bigcategories", "category_indices"
  add_foreign_key "deliveries", "products"
  add_foreign_key "images", "products"
  add_foreign_key "prices", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "category_indices"
  add_foreign_key "smallcategories", "bigcategories"
  add_foreign_key "smallcategories_has_sizes", "sizes"
  add_foreign_key "smallcategories_has_sizes", "smallcategories"
end
