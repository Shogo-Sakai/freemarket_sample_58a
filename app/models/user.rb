class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable
  has_one :profile
  has_one :creditcard

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 7, maximum: 128},format: { with: PASSWORD_VALIDATION }
  validates :password_confirmation, presence: true, length: {minimum: 7, maximum: 128}
  validates :nickname, presence: true,length: {maximum: 20}
  
  # sns認証、認証後、ユーザーの有無に応じて挙動を変更する
  def self.from_omniauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)
    if user
      return user
    else
      new_user = User.new(
        email: auth.info.email,
        nickname: auth.info.name,
        uid: auth.uid,
        provider: auth.provider,
        password: Faker::Internet.password(min_length: 8,max_length: 128)
      )
      return new_user
    end
  end
end
