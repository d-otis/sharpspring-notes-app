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

merle = User.create(
  :first_name => "Merle",
  :last_name => "Haggard",
  :email => "frommuskogee@gmail.com",
  :password => '1234',
  :password_confirmation => '1234'
)

tammy = User.create(
  :first_name => "Tammy",
  :last_name => "Wynette",
  :email => "divorce@gmail.com",
  :password => '4567',
  :password_confirmation => '4567'
)

Category.create([
  {
    name: "Work"
  },
  {
    name: "Personal"
  }
]
)

Note.create([
  {
    title: "Groceries",
    body: "Euismod Tristique Fermentum Sem Justo",
    user: merle
  },
  {
    title: "Ideas for Essays",
    body: "Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Cras mattis consectetur purus sit amet fermentum.",
    user: tammy
  }]
)