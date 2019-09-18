class Smallcategory < ApplicationRecord
  belongs_to :bigcategory
  has_many :smallcategories_has_sizes
end
