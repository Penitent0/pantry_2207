class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredient_names = []
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
      ingredient_names << ingredient.name
      end 
    end
  ingredient_names.uniq
  end

  def highest_calorie_meal
    calories = []
    @recipes.each do |recipe|
      calories << recipe.total_calories
    end
    @recipes.select do |recipe|
      if recipe.total_calories == calories.max
        return recipe
      end
    end
  end
end
