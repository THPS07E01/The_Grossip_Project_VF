class User < ApplicationRecord
  belongs_to :city, optional: true
  has_many :gossips
  has_many :comments
  validates :username, presence: true
end
