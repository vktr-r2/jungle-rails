require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.create(name: "Test category")
    end

    it 'saves successfully when all fields are set' do
      @product = @category.products.create(
        name: 'Test product',
        price: 100,
        quantity: 5
      )
      expect(@product).to be_valid
    end

    it 'does not save when name is nil' do
      @product = @category.products.create(
        name: nil,
        price: 100,
        quantity: 5
      )
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'does not save when quantity is nil' do
      @product = @category.products.create(
        name: 'Test product',
        price: 100,
        quantity: nil
      )
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'does not save when category is nil' do
      @product = Product.create(
        name: 'Test product',
        price: 100,
        quantity: 5,
        category: nil
      )
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    
  end
end

