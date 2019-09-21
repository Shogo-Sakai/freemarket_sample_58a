class Price < ApplicationRecord
  validates :sell, numericality: [greater_than: 300, less_than: 10000000 ]

  belongs_to :product, optional: true
end
