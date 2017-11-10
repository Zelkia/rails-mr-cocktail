require 'json'
require 'open-uri'


puts "cleaning database..."
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

puts "seeding..."

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
  puts "> added #{ingredient['strIngredient1']} to database."
end

cocktails_attributes = [
  {
    name: 'Mojito',
    description: "Sour rum-based cocktail with mint and lime",
    complexity: 2,
    rating:  5,
    glass: 'Highball'
  },
  {
    name: 'Espresso Martini',
    description: "Creamy Coffee Vodka Martini",
    complexity: 1,
    rating:  4,
    glass: 'Martini'
  },
  {
    name: 'White Russian',
    description: "Cream, Vodka and Kahlua on the rocks",
    complexity: 2,
    rating:  3,
    glass: 'Lowball'
  },
  {
    name: 'Hurricane',
    description: "Fruity cocktail with different types of tropical flavours",
    complexity: 1,
    rating:  2,
    glass: 'Highball'
  },
  {
    name: 'Margherita',
    description: "Sharp Tequila cocktail with sour lime",
    complexity: 1,
    rating:  2,
    glass: 'Cocktail'
  }
]

Cocktail.create!(cocktails_attributes)
puts "added Cocktails..."

puts "===> seeded the database with #{Ingredient.count} ingredients!"
