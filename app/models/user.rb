class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_bikes, foreign_key: :owner_id, class_name: "Bike", dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one_attached :avatar
  has_many :reviews, dependent: :destroy
  validates :email, :nickname, presence: true
  validates :nickname, uniqueness: true
end
