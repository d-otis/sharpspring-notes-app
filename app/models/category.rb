class Category < ApplicationRecord
  has_many :note_categories
  has_many :notes, :through => :note_categories

  validates :name, 
            :presence => true, 
            :uniqueness => true, 
            :length => { maximum: 30 }
end