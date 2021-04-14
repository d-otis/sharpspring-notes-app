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

  let(:work_category) {
    Category.create(name: "Work")
  }

  let(:personal_category) {
    Category.create(name: "Personal")
  }

  let(:valid_attrs) do
    {
      title: "First Note",
      body: "Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
      pinned: true,
      user: user
    }
  end

  let(:valid_note) {
    Note.create(valid_attrs)
  }

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

    it "can have many categories" do
      valid_note.categories << work_category
      valid_note.categories << personal_category
      expect(valid_note.categories.length).to eq(2)
    end

  end

  context "validations" do

    let(:long_title) { valid_attrs.merge(:title => "012345678901234567890123456789x") }
    let(:long_body) { valid_attrs.merge(:body => "Maecenas faucibus mollis interdum. Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Donec ullamcorper nulla non metus auctor fringilla.    Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Nullam id dolor id nibh ultricies vehicula ut id elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id dolor id nibh ultricies vehicula ut id elit. Nulla vitae elit libero, a pharetra augue. Nulla vitae elit libero, a pharetra augue. Donec id elit non mi porta gravida at eget metus.") }
    let(:missing_title) { valid_attrs.except(:title) }
    let(:blank_body) { valid_attrs.merge(:body => "") }
    let(:missing_title_and_body) { valid_attrs.except(:title, :body) }
    let(:missing_pinned) { valid_attrs.except(:pinned) }

    it "note is valid with valid attributes" do
      expect(Note.new(valid_attrs)).to be_valid
    end 

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

    it "body cannot be more than 1000 characters" do
      expect(Note.new(long_body)).to be_invalid
    end

    it "pinned defaults to false" do
      expect(Note.new(missing_pinned).pinned).to eq(false)
    end

    it "can only add the same category once" do
      valid_nc_join = NoteCategory.create!(note: valid_note, category: work_category)
      expect{NoteCategory.create!(note: valid_note, category: work_category)}.to raise_error(ActiveRecord::RecordInvalid)
    end

  end
end
