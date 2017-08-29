require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
  describe "GET /login" do
    it "works! (now write some real specs)" do
      get login_path
      expect(response).to have_http_status(200)

      post login_path, params: {
        session: {
          name: "",
          password: ""
        }
      }
      expect(flash).not_to be_empty

      get root_path
      expect(flash).to be_empty
    end
  end
end
