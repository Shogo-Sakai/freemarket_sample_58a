class Smallcategory < ApplicationRecord
  belongs_to :bigcategory, optional:true
  has_many :smallcategories_has_sizes
end
