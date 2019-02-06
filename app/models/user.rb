class User < ApplicationRecord
  belongs_to :city, optional: true
  has_many :gossips
  validates :username, presence: true
end
