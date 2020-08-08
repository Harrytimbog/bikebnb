class Bike < ApplicationRecord
  has_one_attached :photo
  belongs_to :owner, class_name: "User"
  monetize :price_cents
  has_many :reviews, dependent: :destroy
end
