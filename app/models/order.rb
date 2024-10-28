class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { pay_weit: 0, pay_check: 1, make_now: 2, finish: 3 }

  validates :customer_id, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :payment_method, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  validates :status, presence: true
end
