class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  before_save { self.email = email.downcase }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :orders

  with_options presence: true do
    validates :nickname
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, case_sensitive: false
    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
    validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
    validates :family_name, format: { with: /[^ -~｡-ﾟ]+/ }
    validates :first_name, format: { with: /[^ -~｡-ﾟ]+/ }
    validates :family_name_kana, format: { with: /[\p{katakana}　ー－]+/ }
    validates :first_name_kana, format: { with: /[\p{katakana}　ー－]+/ }
    validates :birth_date
  end
end
