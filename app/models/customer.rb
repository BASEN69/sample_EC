class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, uniqueness: true, length: 2..10
  validates :last_name, uniqueness: true, length: 2..10
  validates :first_name_kana, uniqueness: true, length: 2..10
  validates :last_name_kana, uniqueness: true, length: 2..10
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
end
