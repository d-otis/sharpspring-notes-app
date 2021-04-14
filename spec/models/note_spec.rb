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
      note = user.notes.create()
      expect(note.user_id).to eq(user.id)
    end

  end
end
