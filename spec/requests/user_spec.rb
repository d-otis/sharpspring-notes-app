require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /user" do
    it "returns a 200 status" do
      user = create(:user)

      get "/users/#{user.id}"
      expect(response.status).to eq(200)
    end
  end
end
