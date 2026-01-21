# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Product.create([{},{},{}])
#add using console commands
10.times do
Product.create(
    name: Faker:: Commerce.product_name,
    description: "this is sample description",
    price: Faker:: Commerce.price(range: 2000..3000),
    stock: rand(10..20),
    is_active: [true,false].sample #sample will give  random value from the given array
)
end

10.times do
  Customer.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email
  )
end