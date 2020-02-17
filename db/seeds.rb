require 'open-uri'
require 'json'
require 'nokogiri'

puts 'Cleaning database...'
puts '  deleting doses...'
Dose.destroy_all
puts '  deleting cocktails...'
Cocktail.destroy_all
puts '  deleting ingredients...'
Ingredient.destroy_all

puts 'Creating ingredients...'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)
ingredients['drinks'].each do |drink|
  new_ingredient = Ingredient.new(name: drink['strIngredient1'].downcase)
  new_ingredient.save!
end

puts 'Scraping cocktails...'
cocktails_url = 'https://www.bbcgoodfood.com/recipes/collection/cocktail?page=0'
cocktails_serialized = open(cocktails_url).read
html_cocktails = Nokogiri::HTML(cocktails_serialized)

# cocktails names
puts 'Getting names...'
cocktails_names = []
html_cocktails.search('.teaser-item__title a').each do |element|
  cocktails_names << element.text.strip
end

# images url
puts 'Getting images...'
cocktails_images = []
html_cocktails.search('.teaser-item__image a img').each do |element|
  cocktails_images << "https:#{element.attribute('src').value}"
end

# show pages
puts 'Getting show urls...'
cocktail_urls = []
html_cocktails.search('.teaser-item__image a').each do |element|
  cocktail_urls << element.attribute('href').value
  # p element.attribute('href').value
end

puts 'Creating cocktails:'
cocktails_names.each_with_index do |name, i|
  puts "- #{name}"
  cocktail = Cocktail.new(name: name, remote_photo_url: cocktails_images[i])
  cocktail.save!

  cocktail_url = "https://www.bbcgoodfood.com#{cocktail_urls[i]}"
  cocktail_serialized = open(cocktail_url).read
  html_cocktail = Nokogiri::HTML(cocktail_serialized)

  puts '  adding doses...'
  html_cocktail.search('.ingredients-list__group li').each do |element|
    dose = element.attribute('content').value.match(/(?<desc>\d+\s*(g|tbsp|tsp|ml|kg)*\s*)(?<ingr>[a-zA-Z\s]+)/)
    if dose.nil?
      find_ingredient = Ingredient.where("name = ?", element.attribute('content').value).first
      if find_ingredient.nil?
        ingredient = Ingredient.new(name: element.attribute('content').value)
        ingredient.save!
        puts "      new ingredient #{ingredient.id} added in db"
      else
        ingredient = find_ingredient
      end
      new_dose = Dose.new(
        description: '-',
        ingredient_id: ingredient.id,
        cocktail_id: cocktail.id
      )
      new_dose.save!
      puts "    text dose added"
    else
      find_ingredient = Ingredient.where("name = ?", dose[:ingr]).first
      if find_ingredient.nil?
        ingredient = Ingredient.new(name: dose[:ingr])
        ingredient.save!
        puts "      new ingredient #{ingredient.name} added in db"
      else
        ingredient = find_ingredient
      end
      new_dose = Dose.new(
        description: dose[:desc],
        ingredient_id: ingredient.id,
        cocktail_id: cocktail.id
      )
      new_dose.save!
      puts "    #{new_dose.ingredient.name} dose added"
    end
  end
end

puts "Finished!"
