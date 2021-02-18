# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Start seeding"

puts "Cleanup 🧹"
Restaurant.destroy_all

10.times do |index|
  puts "Creating new restaurant 🚜"
  resto = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w(chinese italian japanese french belgian).sample
  )

  3.times do
    puts "Creating new review for #{resto.name} 🚜"
    Review.create(
      rating: (1..5).to_a.sample,
      content: Faker::Lorem.paragraph,
      restaurant: resto
    )
  end
end

puts "Done!"
