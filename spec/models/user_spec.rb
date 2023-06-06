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
  
  end
end
