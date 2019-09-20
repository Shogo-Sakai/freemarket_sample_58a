class Price < ApplicationRecord
  belongs_to :product, optional: true
end
