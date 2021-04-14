class NoteCategory < ApplicationRecord
  belongs_to :note
  belongs_to :category

  validates_uniqueness_of :category_id, :scope => :note_id, :message => "Category has already been assigned to this note."
end