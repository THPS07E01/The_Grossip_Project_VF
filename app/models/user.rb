class User < ApplicationRecord
  acts_as_voter
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_secure_password
  
	validates :email,
	    presence: true, 
	    uniqueness: true,
	    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Un mail valide !" }

  validates :password,  
  	length: {minimum: 5, too_short: "Il faut plus de 5 caractères pour ton mot de passe !"}

  validates :username,
  	presence: true,
  	uniqueness: true


  validates_presence_of :first_name, :message => "Tu as oublié ton prénom !"
  validates_presence_of :last_name, :message => "Tu as oublié ton nom !"
  validates_presence_of :city, :message => "Tu as oublié ta ville !"

end
