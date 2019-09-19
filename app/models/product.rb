class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :size
  belongs_to :brand
  has_many :images
  has_one :price
  has_one :delivery
  has_one_active_hash :product_freshness
  
  # カテゴリ関係
  has_one :category_index
  has_one :bigcategory
  has_one :smallcategory
end
