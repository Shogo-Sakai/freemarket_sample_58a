class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product
  has_one_active_hash :deliver_fee
  has_one_active_hash :deliver_how
  has_one_active_hash :deliver_day
end
