class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_one :creditcard
  
  EMAIL_VALIDATION =  /.*@.*/
  # 1ページ目入力項目
  validates :email,                   presence: true, format: { with: EMAIL_VALIDATION }
  validates :password,                presence: true, length: {minimum: 6, maximum: 128}
  validates :password_confirmation,   presence: true, length: {minimum: 6, maximum: 128}
  validates :nickname, presence: true,length: {maximum: 20}
end
