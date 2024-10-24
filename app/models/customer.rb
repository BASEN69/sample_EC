class Customer < ApplicationRecord

  has_many :addresses, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: 2..10
  validates :last_name, presence: true, length: 2..10
  validates :first_name_kana, presence: true, length: 2..10
  validates :last_name_kana, presence: true, length: 2..10
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
end
