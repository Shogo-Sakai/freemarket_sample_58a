class CategoryIndex < ApplicationRecord
  has_many :bigcategories
  belongs_to :product
end
