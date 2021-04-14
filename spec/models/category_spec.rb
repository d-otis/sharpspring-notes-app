require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:valid_attrs) do
    {
      name: "Work"
    }
  end

  context "attributes" do 
    it "has a name attribute" do
      expect(Category.new).to respond_to(:name)
    end
  end

  context "validations" do
    let(:long_name) { valid_attrs.merge(:title => "012345678901234567890123456789x") }

    it "valid with valid attributes" do
      expect(Category.new(valid_attrs)).to be_valid
    end

    it "name cannot be blank" do
      expect(Category.new).to be_invalid
    end

    it "name cannot be more than 30 characters" do
      expect(Category.new(long_name)).to be_invalid
    end

    it "has a unique name" do
      first_category = Category.create(valid_attrs)
      second_category = Category.create(valid_attrs)

      expect(second_category).to be_invalid
    end
  end
end
