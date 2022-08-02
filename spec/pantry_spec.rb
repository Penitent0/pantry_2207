require './lib/cook_book'
require './lib/recipe'
require './lib/ingredient'
require './lib/pantry'


RSpec.describe Pantry do 
  context 'when a pantry is created it' do 
    let!(:pantry) { Pantry.new }
    let!(:recipe1) { Recipe.new("Mac and Cheese") }
    let!(:recipe2) { Recipe.new("Cheese Burger") }
    let!(:ingredient1) { Ingredient.new({name: "Cheese", unit: "C", calories: 100}) }
    let!(:ingredient2) { Ingredient.new({name: "Macaroni", unit: "oz", calories: 200}) }
    let!(:ingredient3) { Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100}) }
    let!(:ingredient4) { Ingredient.new({name: "Bun", unit: "g", calories: 75}) }

    it 'instantiates' do 
      expect(pantry).to be_a(Pantry)
    end

    it 'has attributes' do
      expect(pantry.stock).to eq({})
    end

    it 'can check stock by ingredient' do
      ingredient_a = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      expect(pantry.stock_check(ingredient1)).to eq(0)
      pantry.restock(ingredient_a, 5)
      pantry.restock(ingredient_a, 10)
      expect(pantry.stock_check(ingredient_a)).to eq(15)
      pantry.restock(ingredient2, 7)
      expect(pantry.stock_check(ingredient2)).to eq(7)
    end

    it 'can check if enough ingredients for recipe' do 
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient2, 8)
      recipe2.add_ingredient(ingredient1, 2)
      recipe2.add_ingredient(ingredient3, 4)
      recipe2.add_ingredient(ingredient4, 1)
      pantry.restock(ingredient1, 5)
      pantry.restock(ingredient1, 10)
      expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)
      pantry.restock(ingredient2, 7)
      expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)
      pantry.restock(ingredient2, 1)
      expect(pantry.enough_ingredients_for?(recipe1)).to eq(true)
    end
  end
end