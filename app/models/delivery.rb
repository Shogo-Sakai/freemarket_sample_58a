class Delivery < ApplicationRecord
  validates :deliver_way, exclusion: {in: %w(---)}
  validates :fee_person,  exclusion: {in: %w(---)}
  validates :from_area,   exclusion: {in: %w(---)}
  validates :sending_day, exclusion: {in: %w(---)}

  belongs_to :product, optional: true
end
