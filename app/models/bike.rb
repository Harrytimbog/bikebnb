class Bike < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  belongs_to :owner, class_name: "User"
end
