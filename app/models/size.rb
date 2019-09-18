class Size < ApplicationRecord
  has_many :smallcategories_has_sizes
  has_one :product
end
