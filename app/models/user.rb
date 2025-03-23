class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ }
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_reading, presence: true, format: { with: /\A[\p{katakana}\u30A0-\u30FF]+\z/ }
  validates :first_reading, presence: true, format: { with: /\A[\p{katakana}\u30A0-\u30FF]+\z/ }
  validates :birthday, presence: true
end
