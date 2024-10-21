class OrderDetail < ApplicationRecord

  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :pric, presence: true
  validates :amount, presence: true
  validates :making_status, presence: true
end
