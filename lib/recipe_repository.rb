require_relative './recipe'

class RecipeRepository
  def inflate(limp)
    flated = Recipe.new
    flated.id = limp['id']
    flated.name = limp["name"]
    flated.cooking_time = limp['cooking_time']
    flated.rating = limp['rating']
    return flated
  end
  
  def all
    sql = 'SELECT * FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])
    array_of_objects = []
    result_set.each do |recipe|
       array_of_objects << inflate(recipe)
    end
    return array_of_objects
  end

  def find(id)
    sql = 'SELECT * FROM recipes WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    return inflate(result_set[0])
  end
end