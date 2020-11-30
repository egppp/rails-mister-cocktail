# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Cleaning database..."
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  name = ingredient["strIngredient1"]
  Ingredient.create(name: name)
  puts "created #{name}"
end

Ingredient.create(name: "Passion fruit")
Ingredient.create(name: "Prosecco")
Ingredient.create(name: "Wine")
Ingredient.create(name: "Mint leaves")
Ingredient.create(name: "Ginger")
Ingredient.create(name: "Simple syrup")



