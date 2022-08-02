require './lib/cook_book'
require './lib/recipe'
require './lib/ingredient'
require './lib/pantry'

RSpec.describe Recipe do
  context 'when a recipe is created it' do
    let!(:recipe1) { Recipe.new("Mac and Cheese") }
    let!(:recipe2) { Recipe.new("Cheese Burger") }
    let!(:ingredient1) { Ingredient.new({name: "Cheese", unit: "C", calories: 100}) }
    let!(:ingredient2) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 30}) }
    let!(:ingredient3) { Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100}) }
    let!(:ingredient4) { Ingredient.new({name: "Bun", unit: "g", calories: 75}) }

    it 'instantiates' do
      expect(recipe1).to be_a(Recipe)
    end

    it 'has a name' do 
      expect(recipe1.name).to eq("Mac and Cheese")
    end

    it 'has and can add ingredients' do
      expect(recipe1.ingredients_required).to eq({})
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient1, 4)
      recipe1.add_ingredient(ingredient2, 8)
      expect(recipe1.ingredients_required).to eq({ingredient1 => 6, ingredient2 => 8})
      expect(recipe1.ingredients).to eq([ingredient1, ingredient2])
    end

    it 'has total calories' do
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient2, 8)
      recipe2.add_ingredient(ingredient1, 2)
      recipe2.add_ingredient(ingredient3, 4)
      recipe2.add_ingredient(ingredient4, 1)
      expect(recipe1.total_calories).to eq(440)
      expect(recipe2.total_calories).to eq(675)
    end
  end
end