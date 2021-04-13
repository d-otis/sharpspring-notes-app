require 'rails_helper'

RSpec.describe User, type: :model do

  let(:valid_attrs) do 
    {
    :first_name => "Patsy",
    :last_name => "Cline",
    :email => "bluemoonkentucky@gmail.com",
    :password => "crazy!1234%^&",
    :password_confirmation => "crazy!1234%^&"
    }
  end

  context "create" do

    let(:missing_first_name) { valid_attrs.except(:first_name) }
    let(:missing_last_name) { valid_attrs.except(:last_name) }
    let(:missing_email) { valid_attrs.except(:email) }
    let(:missing_password) { valid_attrs.except(:password) }
    let(:missing_password_confirmation) { valid_attrs.except(:password_confirmation) }
    let(:password_mismatch) { valid_attrs.merge(:password_confirmation => '0000') }

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
