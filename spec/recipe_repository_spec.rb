require 'recipe_repository'
require 'recipe'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

RSpec.describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  it "returns all recipes" do
    repo = RecipeRepository.new

    recipes = repo.all
    p recipes
    expect(recipes.length).to eq 4

    expect(recipes[0].id).to eq '1'
    expect(recipes[0].name).to eq 'Borgir'
    expect(recipes[0].cooking_time).to eq '10'
    expect(recipes[0].rating).to eq '5'

    expect(recipes[-1].id).to eq '4'
    expect(recipes[-1].name).to eq 'Birthday Cake'
    expect(recipes[-1].cooking_time).to eq '90'
    expect(recipes[-1].rating).to eq '1'
  end

  it "returns a single recipe by id" do
    repo = RecipeRepository.new

    recipe1 = repo.find(1)
    recipe2 = repo.find(3)

    expect(recipe1.id).to eq '1'
    expect(recipe1.name).to eq 'Borgir'
    expect(recipe1.cooking_time).to eq '10'
    expect(recipe1.rating).to eq '5'

    expect(recipe2.id).to eq '3'
    expect(recipe2.name).to eq 'Cereal'
    expect(recipe2.cooking_time).to eq '1'
    expect(recipe2.rating).to eq '3'
  end

  it "fails when find called with id not in table" do
    repo = RecipeRepository.new

    expect{ repo.find(5) }.to raise_error "Index 0 is out of range"
  end
end