class Order < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  monetize :amount_cents
end
