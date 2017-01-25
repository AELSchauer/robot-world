# db/migrations/002_populate_robots_with_random_data.rb

require 'sqlite3'
require 'faker'

number = ARGV.first.to_i
number = number < 1 ? 50 : number
number = number > 100 ? 100 : number

database = SQLite3::Database.new("db/robot_world.db")
state_abbvs = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

number.times do
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  city = Faker::GameOfThrones.city
  state = state_abbvs.sample
  department = Faker::Space.moon
  picture = Faker::Avatar.image
  database.execute(
    "INSERT INTO robots (name, city, state, department, picture) VALUES (?, ?, ?, ?, ?);",
    name, city, state, department, picture
  )
end