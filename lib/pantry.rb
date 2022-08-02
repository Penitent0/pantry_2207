class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.each do |recipe_ingredient, required_amount|
      stock.each do |stock_ingredient, stock_amount|
          require 'pry'; binding.pry
      end
    end
  end
end
