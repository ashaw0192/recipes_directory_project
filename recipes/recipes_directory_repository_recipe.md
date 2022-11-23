{{TABLE NAME}} Model and Repository Classes Design Recipe

1. Design and create the Table

Table: recipes

Columns:
id | name | cooking_time | rating

2. Create Test SQL seeds

-- (file: spec/seeds_recipes.sql)

TRUNCATE TABLE recipes RESTART IDENTITY;

INSERT INTO recipes (name, cooking_time, rating) VALUES ('Borgir', 10, 5);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Sgetti', 12, 4);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Cereal', 1, 3);
INSERT INTO recipes (name, cooking_time, rating) VALUES ('Birthday Cake', 90, 1);

psql -h 127.0.0.1 your_database_name < seeds_recipes.sql

3. Define the class names

# Table name: recipes

# Model class
# (in lib/recipe.rb)
class Recipe
end

# Repository class
# (in lib/recipe_repository.rb)
class RecipeRepository
end

4. Implement the Model class

# Table name: recipes

# Model class
# (in lib/recipe.rb)

class Recipe
  attr_accessor :id, :name, :cooking_time, :rating
end

5. Define the Repository Class interface

# Table name: recipes

# Repository class
# (in lib/recipe_repository.rb)

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM recipes;

    # Returns an array of Student objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT * FROM recipes WHERE id = $1;

    # Returns a single recipe object.
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(student)
  # end

  # def update(student)
  # end

  # def delete(student)
  # end
end
6. Write Test Examples

```ruby

# 1
# Get all recipes

repo = RecipeRepository.new

recipes = repo.all

recipes.length # =>  2

recipes[0].id # =>  1
recipes[0].name # =>  'Borgir'
recipes[0].cooking_time # =>  10
recipes[0].rating # => 5

recipes[-1].id # =>  4
recipes[-1].name # =>  'Birthday Cake'
recipes[-1].cooking_time # => 90
recipes[-1].rating # => 1

# 2
# Get a single recipe

repo = RecipeRepository.new

recipe1 = repo.find(1)
recipe2 = repo.find(3)

recipe1.id # =>  1
recipe1.name # =>  'Borgir'
recipe1.cooking_time # =>  10
recipe1.rating # => 5

recipe2.id # =>  3
recipe2.name # =>  'Cereal'
recipe2.cooking_time # =>  1
recipe2.rating # => 3

# 3
# find a recipe that doesn't exist in table

recipe = repo.find(5) # => 'Index 0 out of range'


# Add more examples for each method
Encode this example as a test.

```

7. Reload the SQL seeds before each test run

# file: spec/recipe_repository_spec.rb

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

