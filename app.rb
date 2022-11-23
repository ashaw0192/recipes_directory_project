require_relative './lib/database_connection'
#require_relative './lib/recipe_repository'
require_relative './lib/test'

DatabaseConnection.connect('recipes_directory')

recipe_repo = RecipeRepository.new

recipe_repo.all.each do |recipe|
  p recipe.id + " - " + recipe.name + " - " + recipe.cooking_time + " - " + recipe.rating
end