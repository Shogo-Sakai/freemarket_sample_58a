class Profile < ApplicationRecord
  belongs_to :user

  validates :birthyear, presence: true
  validates :birthmonth, presence: true
  validates :birthday, presence: true
  validates :family_name, presence: true
  validates :personal_name, presence: true
  validates :family_name_kana, presence: true
  validates :personal_name_kana, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :adress, presence: true
end
