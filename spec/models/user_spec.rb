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

  context "attributes" do

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

  context "validations" do

    let(:missing_first_name) { valid_attrs.except(:first_name) }
    let(:missing_last_name) { valid_attrs.except(:last_name) }
    let(:missing_email) { valid_attrs.except(:email) }
    let(:missing_password) { valid_attrs.except(:password) }
    let(:missing_password_confirmation) { valid_attrs.except(:password_confirmation) }
    let(:password_mismatch) { valid_attrs.merge(:password_confirmation => '0000') }
  
    it "is valid with first_name, last_name, password, password_confirmation, email" do
      expect(User.new(valid_attrs)).to be_valid
    end
  
    it "is invalid without email" do
      expect(User.new(missing_email)).to be_invalid
    end
    
    it "is invalid without first_name" do
      expect(User.new(missing_first_name)).to be_invalid
    end

    it "is invalid without last_name" do
      expect(User.new(missing_last_name)).to be_invalid
    end

    it "is invalid without password" do
      expect(User.new(missing_password)).to be_invalid
    end

    it "is invalid without password_confirmation" do
      expect(User.new(missing_password_confirmation)).to be_invalid
    end
    
    it "is invalid password_mismatch" do
      expect(User.new(password_mismatch)).to be_invalid
    end

    it "is invalid if email is already registered" do
      user = User.create(valid_attrs)

      expect(User.new(valid_attrs)).to be_invalid
    end

  end
end
