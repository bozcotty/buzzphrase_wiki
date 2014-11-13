require 'faker'

#create 5 topics
topics = []
5.times do
  topics << Topic.create(
    title: Faker::Company.bs,
    body: Faker::Lorem.paragraph(rand(1..3))
    )
end

u = User.new(email: 'shalemont@gmail.com', password: 'password', password_confirmation: 'password')
# u.skip_confirmation!
u.save
# u.update_attribute(:role, 'member')


8.times do
  password = Faker::Lorem.characters(8)
  u = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    role: 'member')
  # u.skip_confirmation!
  u.save
end

puts "#{User.count} users created"
puts "#{Topic.count} topics created"
