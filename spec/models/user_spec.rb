require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it "should save new user" do
      @user = User.new( :first_name => "Test", :last_name => "test", :password => "testtest", :password_confirmation => "testtest", :email => "test@test.COM")
      @user.save!
      expect(@user).to be_present
    end

  end

  describe '.authenticate_with_credentials' do
    it "checks the login and returns the authenticated user" do
      user = User.create( :first_name => "Rex", :last_name => "Raptor", :email => "rex@raptor.com", :password => "123456", :password_confirmation => "123456")
      authenticated_user = User.authenticate_with_credentials("rex@raptor.com", "123456")
      expect(authenticated_user).to eq(user)
    end
  end
end