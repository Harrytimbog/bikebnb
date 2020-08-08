class Review < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  validates :content, :rating, presence: true
end
