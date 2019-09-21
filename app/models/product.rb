class Product < ApplicationRecord
  belongs_to :user,  optional:true
  belongs_to :brand, optional:true
  has_many :images,  dependent: :destroy
  accepts_nested_attributes_for :images
  has_one :price 
  has_one :delivery
  
  # カテゴリ関係
  has_one :category_index
  has_one :bigcategory
  has_one :smallcategory
  has_one :size
end
