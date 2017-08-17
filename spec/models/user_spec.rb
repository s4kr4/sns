require 'rails_helper'

RSpec.describe User, type: :model do

  describe "User model" do
    before do
      @user = User.new(name: "testuser",
                      email: "testuser@example.com",
                      password: "password",
                      password_confirmation: "password")
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

      it "email validation should accept valid addresses" do
        valid_address = %w[testuser@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
        valid_address.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid, "#{valid_address.inspect} should be valid"
        end
      end

      it "email validation should reject invalid addresses" do
        invalid_address = %w[testuser@example,com user_at_foo.bar.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
        invalid_address.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid, "#{invalid_address.inspect} should be invalid"
        end
      end

      it "email addresses should be unique" do
        duplicate_user = @user.dup
        duplicate_user.email = @user.email.upcase
        @user.save
        expect(duplicate_user).not_to be_valid
      end

      it "password should be present" do
        @user.password = @user.password_confirmation = " " * 7
        expect(@user).not_to be_valid
      end

      it "password should have a minimum length" do
        @user.password = @user.password_confirmation = "a" * 6
        expect(@user).not_to be_valid
      end
    end
  end
end
