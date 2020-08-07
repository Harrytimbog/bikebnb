class Bike < ApplicationRecord
  has_one_attached :photo
  belongs_to :owner, class_name: "User"
end