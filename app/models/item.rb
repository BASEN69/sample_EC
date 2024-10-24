class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  validates :is_active, inclusion: { in: [true, false] }

  def add_tax_price
    (self.price * 1.10).round
  end

end
