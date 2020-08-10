class Bike < ApplicationRecord
  has_one_attached :photo
  belongs_to :owner, class_name: "User"
  validates :name, :price_cents, :sku, :photo, :category, :address, presence: true
  has_many :reviews, dependent: :destroy
  monetize :price_cents
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
