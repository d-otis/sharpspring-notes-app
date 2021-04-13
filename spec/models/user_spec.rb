require 'rails_helper'

RSpec.describe User, type: :model do
  context "create" do
    it "has a first_name attribute" do
      expect(User.new).to respond_to(:first_name)
    end
    it "has a last_name attribute" do
      expect(User.new).to respond_to(:last_name)
    end
    it "has a email attribute" do
      expect(User.new).to respond_to(:email)
    end
    it "has a password attribute" do
      expect(User.new).to respond_to(:password)
    end
    it "has a password_confirmation attribute" do
      expect(User.new).to respond_to(:password_confirmation)
    end
  end
end
