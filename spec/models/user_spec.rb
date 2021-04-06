require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'will save successfully with all fields set' do
      @user = User.new(first_name: "One", last_name: "Two", email: "one@one.com", password: "55555", password_confirmation: "55555")
      expect(@user).to be_valid
    end

    it 'requires a first name' do
      @user = User.new(first_name: nil, last_name: "Two", email: "one@one.com", password: "55555", password_confirmation: "55555")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'requires a last name' do
      @user = User.new(first_name: "One", last_name: nil, email: "one@one.com", password: "55555", password_confirmation: "55555")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'requires an email' do
      @user = User.new(first_name: "One", last_name: "Two", email: nil, password: "55555", password_confirmation: "55555")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'requires a unique email' do
      @user = User.new(first_name: "One", last_name: "Two", email: "one@one.com", password: "55555", password_confirmation: "55555")
      @user.save!
      @user1 = User.new(first_name: "Three", last_name: "Four", email: "one@one.com", password: "55555", password_confirmation: "55555")
      expect(@user1).to_not be_valid
      expect(@user1.errors.full_messages).to include("Email has already been taken")
    end

    it 'requires a password and password confirmation' do
      @user = User.new(first_name: "One", last_name: "Two", email: "one@one.com", password: nil, password_confirmation: nil)
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'requires password and password confirmation to be the same' do
      @user = User.new(first_name: "One", last_name: "Two", email: "one@one.com", password: "55555", password_confirmation: "5555")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'requires password to be five characters or longer' do
      @user = User.new(first_name: "One", last_name: "Two", email: "one@one.com", password: "555", password_confirmation: "555")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
      
  end
end
