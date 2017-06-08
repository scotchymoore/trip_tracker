50.times do
  user = User.create(email: Faker::Internet.email, password: 'password')
  puts "User with email: #{user.email} created!"
  
end

puts 'Users Seeded!'
