class Bigcategory < ApplicationRecord
  belongs_to :category_index, optional:true
  has_many :smallcategories
end
