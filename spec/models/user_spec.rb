require 'rails_helper'

RSpec.describe User, type: :model do

  describe "User model" do
    before do
      @user = User.new(name: "testuser", email: "testuser@test.com")
    end

    context "Valid user model" do
      it "should be valid" do
        expect(@user).to be_valid
      end

      it "name should be present" do
        @user.name = " "
        expect(@user).not_to be_valid
      end

      it "email should be present" do
        @user.email = " "
        expect(@user).not_to be_valid
      end

      it "name should not be too long" do
        @user.name = "a" * 51
        expect(@user).not_to be_valid
      end

      it "email should not be too long" do
        @user.email = "a" * 247 + "@test.com"
        expect(@user).not_to be_valid
      end
    end
  end
end
