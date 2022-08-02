require './lib/cook_book'
require './lib/recipe'
require './lib/ingredient'
require './lib/pantry'

RSpec.describe CookBook do
  let!(:cookbook) {CookBook.new}
  let!(:recipe1) { Recipe.new("Mac and Cheese") }
  let!(:recipe2) { Recipe.new("Cheese Burger") }
  let!(:ingredient1) { Ingredient.new({name: "Cheese", unit: "C", calories: 100}) }
  let!(:ingredient2) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 30}) }
  let!(:ingredient3) { Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100}) }
  let!(:ingredient4) { Ingredient.new({name: "Bun", unit: "g", calories: 75}) }

  context 'when a cookbook is created it' do
    it 'instantiates' do
      expect(cookbook).to be_a(CookBook)
    end

    it 'has and can add recipes' do
      expect(cookbook.recipes).to eq([])
      expect(cookbook.add_recipe(recipe1))
      expect(cookbook.add_recipe(recipe2))
      expect(cookbook.recipes).to eq([recipe1, recipe2])
    end
  end 

  context 'a cookbook can take added recipes and' do
    it 'list ingredients for recipes' do
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient2, 8)
      recipe2.add_ingredient(ingredient1, 2)
      recipe2.add_ingredient(ingredient3, 4)
      recipe2.add_ingredient(ingredient4, 1)
      cookbook.add_recipe(recipe1)
      cookbook.add_recipe(recipe2)
      expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
    end

    it 'list highest calorie meal' do
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient2, 8)
      recipe2.add_ingredient(ingredient1, 2)
      recipe2.add_ingredient(ingredient3, 4)
      recipe2.add_ingredient(ingredient4, 1)
      cookbook.add_recipe(recipe1)
      cookbook.add_recipe(recipe2)
      expect(cookbook.highest_calorie_meal).to eq(recipe2)
    end
  end
end