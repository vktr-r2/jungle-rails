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

    it 'is invalid without an email' do
      user = User.new(
        name: 'Test User',
        email: nil,
        password: 'testpassword',
        password_confirmation: 'testpassword'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is invalid without a password and password confirmation' do
      user = User.new(
        name: 'Test User',
        email: 'test@example.com',
        password: nil,
        password_confirmation: nil
      )
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is invalid if password and password_confirmation do not match' do
      user = User.new(
        name: 'Test User',
        email: 'test@example.com',
        password: 'testpassword',
        password_confirmation: 'wrongpassword'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is invalid with a duplicate email address' do
      User.create(
        name: 'Test User1',
        email: 'test@example.com',
        password: 'testpassword',
        password_confirmation: 'testpassword'
      )
      user = User.new(
        name: 'Test User2',
        email: 'TEST@example.com',
        password: 'testpassword',
        password_confirmation: 'testpassword'
      )
      user.valid?
      expect(user.errors.full_messages).to include("Email has already been taken")
    end
  
  end
end
