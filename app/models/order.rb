class Order < ApplicationRecord

  validates :customer_id, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :payment_method, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  validates :status, presence: true
end
