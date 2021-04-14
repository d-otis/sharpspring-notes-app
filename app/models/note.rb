class Note < ApplicationRecord
  belongs_to :user, inverse_of: :notes

  before_validation :check_title, unless: :title?

  validates :title, presence: true, length: { maximum: 30 }
  validates :body, length: { maximum: 1000 }


  private

  def check_title
    if body?
      self.title = body.slice(0, 30)
    else
      :abort
    end
  end
end