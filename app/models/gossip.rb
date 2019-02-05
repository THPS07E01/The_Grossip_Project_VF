class Gossip < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :message => "Tu as oublié le titre, bébé"
  validates_presence_of :content, :message => "Tu as oublié le contenu du potin, bébé"
end
