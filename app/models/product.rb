class Product < ApplicationRecord
  belongs_to :user,  optional:true
  belongs_to :brand, optional:true
  has_many :product_images,  dependent: :destroy
  accepts_nested_attributes_for :product_images
  has_one :price
  accepts_nested_attributes_for :price
  has_one :delivery
  accepts_nested_attributes_for :delivery
  
  # カテゴリ関係
  has_one :category_index
  has_one :bigcategory
  has_one :smallcategory
  has_one :size
end
