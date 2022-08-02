require './lib/cook_book'
require './lib/recipe'
require './lib/ingredient'
require './lib/pantry'

RSpec.describe Ingredient do
  context 'when ingredient is created it' do
    let!(:ingredient1) {Ingredient.new({name: "Cheese", unit: "oz", calories: 50})}
    let!(:ingredient2) {Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})}

    it 'instantiates' do
      expect(ingredient1).to be_a(Ingredient)
    end

    it 'has attrubutes' do 
      expect(ingredient1.name).to eq("Cheese")
      expect(ingredient1.unit).to eq("oz")
      expect(ingredient1.calories).to eq(50)
    end
  end


end