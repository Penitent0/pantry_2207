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
    stock.each do |ingredient, amount|
      recipe.ingredients_required.each do |req_ingredient, req_amount|
        if req_ingredient == ingredient && req_amount >= amount
          return true
        elsif req_ingredient == ingredient && req_amount <= amount
          return false
        end
      end
    end
  end
end
