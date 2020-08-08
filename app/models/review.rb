class Review < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  validates :content, :rating, presence: true
  has_many :reviews, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
