class Delivery < ApplicationRecord
  belongs_to :product, optional: true
end
