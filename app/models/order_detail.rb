class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item
  
  enum making_status: { no_make: 0, waiting: 1, makeing: 2, makeup: 3 }

  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :price, presence: true
  validates :amount, presence: true
  validates :making_status, presence: true
end
