require 'rails_helper'

RSpec.describe "UserSignups", type: :request do
  describe "GET /signup" do
    before do
      @user
    end

    it "invalid signup information" do
      get signup_path
      expect(response).to have_http_status(200)

      post signup_path, params: {
        user: {
          name: "",
          email: "test@example.com"
        }
      }
      redirect_to(:action => "users/new")
    end

    it "valid signup information" do
      get signup_path
      expect(response).to have_http_status(200)

      post signup_path, params: {
        user: {
          name: "test",
          email: "test@example.com"
        }
      }
      redirect_to(:action => "users/show")
    end
  end
end
