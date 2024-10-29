# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by!(email: "admin@exmple.com") do |admin|
  admin.password = "asasas123"
end

Customer.find_or_create_by!(email: "as@exmple.com") do |customer|
  customer.password = "asasas12"
  customer.first_name = "川越"
  customer.last_name = "太郎"
  customer.first_name_kana = "カワゴエ"
  customer.last_name_kana = "タロウ"
  customer.postal_code = "3501111"
  customer.address = "埼玉県川越市"
  customer.telephone_number = "00000000000"
end