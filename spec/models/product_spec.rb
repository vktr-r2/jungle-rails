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
  end
end

