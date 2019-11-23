# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Cleaning database...'
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Creating ingredients...'
Ingredient.create(name: 'tequila')
Ingredient.create(name: 'limes')
Ingredient.create(name: 'brown sugar')
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)
165.times do
  Ingredient.create(name: ingredients['drinks'].sample['strIngredient1'].downcase)
end

puts 'Creating cocktails...'
caipirinha = Cocktail.new(name: 'Caipirinha')
caipirinha.remote_photo_url = 'https://res.cloudinary.com/digkmcfas/image/upload/v1574540032/Rails%20Mister%20Cocktails/caiprinha.jpg'
caipirinha.save
margarita = Cocktail.new(name: 'Margarita')
margarita.remote_photo_url = 'https://res.cloudinary.com/digkmcfas/image/upload/v1574540053/Rails%20Mister%20Cocktails/margarita.jpg'
margarita.save
sangria = Cocktail.new(name: 'Sangria')
sangria.remote_photo_url = 'https://res.cloudinary.com/digkmcfas/image/upload/v1574540062/Rails%20Mister%20Cocktails/sangria.jpg'
sangria.save
earl_grey_martini = Cocktail.new(name: 'Earl Grey Martini')
earl_grey_martini.remote_photo_url = 'https://res.cloudinary.com/digkmcfas/image/upload/v1574540041/Rails%20Mister%20Cocktails/earl_grey_martini.jpg'
earl_grey_martini.save
sloe_gin_cocktail = Cocktail.new(name: 'Sloe gin cocktail')
sloe_gin_cocktail.remote_photo_url = 'https://res.cloudinary.com/digkmcfas/image/upload/v1574540066/Rails%20Mister%20Cocktails/sloe_gin_cocktail.jpg'
sloe_gin_cocktail.save
mojito = Cocktail.new(name: 'Mojito')
mojito.remote_photo_url = 'https://res.cloudinary.com/digkmcfas/image/upload/v1574540058/Rails%20Mister%20Cocktails/mojito.jpg'
mojito.save
bloody_mary = Cocktail.new(name: 'Bloody Mary')
bloody_mary.remote_photo_url = 'https://res.cloudinary.com/digkmcfas/image/upload/v1574540026/Rails%20Mister%20Cocktails/bloody_mary.jpg'
bloody_mary.save
cuba_libre = Cocktail.new(name: 'Cuba Libre')
cuba_libre.remote_photo_url = 'https://res.cloudinary.com/digkmcfas/image/upload/v1574540038/Rails%20Mister%20Cocktails/cuba_libre.jpg'
cuba_libre.save
mai_tai = Cocktail.new(name: 'Mai Tai')
mai_tai.remote_photo_url = 'https://res.cloudinary.com/digkmcfas/image/upload/v1574540049/Rails%20Mister%20Cocktails/mai_tai.jpg'
mai_tai.save

# puts 'Creating doses for a cocktail...'
# Dose.create(
#   description: '2',
#   ingredient: Ingredient.where(name: 'limes')[0],
#   cocktail: Cocktail.where(name: 'Caipirinha')
# )
# Dose.create(
#   description: '2',
#   ingredient: Ingredient.where(name: 'limes')[0],
#   cocktail: Cocktail.where(name: 'Caipirinha')
# )
# Dose.create(
#   description: '6 tbsp',
#   ingredient: Ingredient.where(name: 'brown sugar')[0],
#   cocktail: Cocktail.where(name: 'Caipirinha')
# )
# Dose.create(
#   description: '400g',
#   ingredient: Ingredient.where(name: 'ice')[0],
#   cocktail: Cocktail.where(name: 'Caipirinha')
# )
# Dose.create(
#   description: '200ml',
#   ingredient: Ingredient.where(name: 'cachaca')[0],
#   cocktail: Cocktail.where(name: 'Caipirinha')
# )

# puts 'Creating doses for a cocktail...'
# Dose.create(
#   description: '50ml',
#   ingredient: Ingredient.where(name: 'tequila')[0],
#   cocktail: Cocktail.where(name: 'Margarita')
# )
# Dose.create(
#   description: '25ml',
#   ingredient: Ingredient.where(name: 'triple sec')[0],
#   cocktail: Cocktail.where(name: 'Margarita')
# )
# Dose.create(
#   description: '25ml',
#   ingredient: Ingredient.where(name: 'lime juice')[0],
#   cocktail: Cocktail.where(name: 'Margarita')
# )
# Dose.create(
#   description: '15ml',
#   ingredient: Ingredient.where(name: 'sugar syrup')[0],
#   cocktail: Cocktail.where(name: 'Margarita')
# )
# Dose.create(
#   description: 'large handful of',
#   ingredient: Ingredient.where(name: 'ice')[0],
#   cocktail: Cocktail.where(name: 'Margarita')
# )
