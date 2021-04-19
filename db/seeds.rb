# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Note.destroy_all
Category.destroy_all
NoteCategory.destroy_all

num_users = 3
num_notes_per_user = 15

num_users.times do
  User.create(
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :email => Faker::Internet.email,
    :password => '1234',
    :password_confirmation => '1234'
  )
end

test_user = User.create(
  :first_name => "Patsy",
  :last_name => "Cline",
  :email => patsy.cline@gmail.com,
  :password => "1234",
  :password_confirmation => "1234"
)

puts "Generated #{User.all.count} users."

User.all.each do |user|
  num_notes_per_user.times do
    Note.create(
      :title => Faker::Lorem.sentence,
      :body => Faker::Lorem.paragraph,
      :pinned => Faker::Boolean.boolean,
      :user => user
    )
  end
end

puts "Generated #{Note.all.count} notes."