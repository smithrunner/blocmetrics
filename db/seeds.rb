require 'faker'

3.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

5.times do
  registered_application = RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Internet.domain_name,
    URL: Faker::Internet.url
  )
end

registered_applications = RegisteredApplication.all

10.times do
  event = Event.create!(
    registered_application: registered_applications.sample,
    event_name: Faker::Dessert.variety
  )
end

events = Event.all



