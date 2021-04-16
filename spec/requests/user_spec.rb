require 'rails_helper'

RSpec.describe "Users", type: :request do
  context "GET /user" do
    let(:fake_user) { create(:user) }

    it "returns a 200 status" do
      get user_path(fake_user)
      expect(response).to have_http_status(:success)
    end

    it "renders show template" do
      get user_path(fake_user)
      expect(response).to render_template(:show)
    end

    it "renders user name on page" do
      get user_path(fake_user)
      expect(response.body).to include("Welcome, #{fake_user.full_name}!")
    end

    it "renders email address on user show" do
      get user_path(fake_user)
      expect(response.body).to include(fake_user.email)
    end
  end

  context "GET /users/new" do
    it "returns a 200 status" do
      get new_user_path
      expect(response).to have_http_status(:success)
    end

    it "successfully routes '/register' to users#new" do
      get "/register"
      expect(response).to render_template(:new)
    end

    it "renders new template" do
      get new_user_path
      expect(response).to render_template(:new)
    end

    it "includes the appropriate text" do
      get new_user_path
      expect(response.body).to include("Create a New User")
    end

  end

  context "GET /users/:id/edit" do

    let(:fake_user) { create(:user) }

    it "returns a status of 200" do
      get edit_user_path(fake_user)
      expect(response.status).to eq(200)
    end

    it "renders edit template" do
      get edit_user_path(fake_user)
      expect(response).to render_template(:edit)
    end
    
    it "includes the appropriate text" do
      get edit_user_path(fake_user)
      expect(response.body).to include("Edit User")
    end
  end

  context "POST /users" do
    it "returns a status of 200" do
      post users_path
      expect(response).to have_http_status(:created)
    end
  end

  context "PATCH /users/:id" do
    let(:fake_user) { create(:user) }
  end

  context "DELETE /users/:id" do
    let(:fake_user) { create(:user) }
  end
end
