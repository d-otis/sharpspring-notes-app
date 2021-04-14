require 'rails_helper'

RSpec.describe Note, type: :model do

  let(:user) {
    User.create(
      :first_name => "Patsy",
      :last_name => "Cline",
      :email => "bluemoonkentucky@gmail.com",
      :password => "crazy!1234%^&",
      :password_confirmation => "crazy!1234%^&"
    )
  }

  let(:valid_attrs) do
    {
      title: "First Note",
      body: "Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      pinned: true,
      user: user
    }
  end

  context "attributes" do

    it "has a title attribute" do
      expect(Note.new).to respond_to(:title)
    end

    it "has a body attribute" do
      expect(Note.new).to respond_to(:body)
    end

    it "has a pinned attribute" do
      expect(Note.new).to respond_to(:pinned)
    end

    it "has a user_id attribute" do
      expect(Note.new).to respond_to(:user_id)
    end

  end

  context "associations" do

    it "is owned by a user" do
      note = user.notes.create(valid_attrs)
      expect(note.user_id).to eq(user.id)
    end

  end

  context "validations" do

    let(:long_title) { valid_attrs.merge(:title => "012345678901234567890123456789x") }
    let(:missing_title) { valid_attrs.except(:title) }
    let(:blank_body) { valid_attrs.merge(:body => "") }
    let(:missing_title_and_body) { valid_attrs.except(:title, :body) }

    it "title cannot be more than 30 characters" do
      expect(Note.new(long_title)).to be_invalid
    end

    it "body can be blank" do
      expect(Note.new(blank_body)).to be_valid
    end

    it "when title left blank: title defaults to first 30 chars of body " do
      note = Note.create(missing_title)
      expect(note.title).to eq("Etiam porta sem malesuada magn")
    end
    
    it "cannot have missing title and missing body" do
      expect(Note.new(missing_title_and_body)).to be_invalid
    end

  end
end
