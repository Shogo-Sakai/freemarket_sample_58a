class Product < ApplicationRecord
  belongs_to :category_index
  belongs_to :size
  belongs_to :brand
  has_many :images
  has_one :price
  has_one :category_index
  has_one :delivery
end
