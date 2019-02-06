class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title,  length: {minimum: 3, maximum: 14, too_short: "Il faut plus de 3 caractères dans ton titre !", too_long: "Tu dois écrire un titre de moins de 14 caractères !"   }

  validates_presence_of :title, :message => "Tu as oublié le titre, bébé"
  validates_presence_of :content, :message => "Tu as oublié le contenu du potin, bébé"
end
