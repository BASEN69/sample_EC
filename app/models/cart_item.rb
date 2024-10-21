class CartItem < ApplicationRecord

  validates :item_id, presence: true
  validates :customer_id, presence: true
  validates :amount, presence: true
end
