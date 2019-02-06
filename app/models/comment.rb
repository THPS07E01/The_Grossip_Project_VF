class Comment < ApplicationRecord
  belongs_to :gossip, optional: true
  belongs_to :user, optional: true
  validates_presence_of :content, :message => "Tu as oublié le contenu, bébé"

end
