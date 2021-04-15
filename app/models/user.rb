class User < ApplicationRecord
  has_many :notes, inverse_of: :user

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  def full_name
    [ first_name, last_name ].join(" ") 
  end
end