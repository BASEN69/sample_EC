class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  validates :item_id, presence: true
  validates :customer_id, presence: true
  validates :amount, presence: true
end
