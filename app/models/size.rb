class Size < ApplicationRecord
  has_many :smallcategories_has_sizes
  belongs_to :product, optional:true
end
