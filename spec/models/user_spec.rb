require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'will save successfully with all fields set' do
      @user = User.new(first_name: "One", last_name: "Two", email: "one@one.com", password: "one", password_confirmation: "one")
      expect(@user).to be_valid
    end

    it 'requires a first name' do
      @user = User.new(first_name: nil, last_name: "Two", email: "one@one.com", password: "one", password_confirmation: "one")
      expect(@user).to_not be_valid
    end

    it 'requires a last name' do
      @user = User.new(first_name: "One", last_name: nil, email: "one@one.com", password: "one", password_confirmation: "one")
      expect(@user).to_not be_valid
    end

  # requires an email
  # requires a unique email
  # requires a pw and pw confirmation
  # both pw and pw confirmation fields are the same
  # pw cannot be shorter than minimum length (to add to model and test)

  end
end
