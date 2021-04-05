require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'will save successfully with all fields set' do
      @category = Category.new(name: "test category")
      @product = Product.new(name: "test product", price: 1, quantity: 1, category: @category)
      expect(@product).to be_valid
    end
    
    it 'requires a name' do
      @category = Category.new(name: "test category")
      @product = Product.new(name: nil, price: 1, quantity: 1, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'requires a price' do
      @category = Category.new(name: "test category")
      @product = Product.new(name: "test product", price: nil, quantity: 1, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'requires a quantity' do
      @category = Category.new(name: "test category")
      @product = Product.new(name: "test product", price: 1, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'requires a category' do
      @product = Product.new(name: "test product", price: 1, quantity: 1, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
