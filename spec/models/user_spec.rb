require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'is valid with a name, email, password and password_confirmation' do
      user = User.new(
        name: 'Test User',
        email: 'test@example.com',
        password: 'testpassword',
        password_confirmation: 'testpassword'
      )
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(
        name: nil,
        email: 'test@example.com',
        password: 'testpassword',
        password_confirmation: 'testpassword'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
  
  end
end
