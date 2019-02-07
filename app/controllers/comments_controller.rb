class CommentsController < ApplicationController
  before_action :authenticate_user
    def index
      # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    end
  
    def new
    end
    
    def create
      
      @comment = Comment.new(gossip_id: params[:gossip_id], user_id: User.last.id, content: params['comment_content'])
      if @comment.save     # si ça marche, il redirige vers la page d'index du site
        flash[:success] = 'It worked : Comment successfully added!'
        redirect_to gossip_path(params[:gossip_id])
      else      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        flash[:danger] = 'Something went wrong.'
        redirect_to gossip_path(params[:gossip_id])
        flash.delete(:danger)
      end
    end
  
    def show
    end
  
    def edit
      # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    end
  
    def update
      # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
      # pour info, le contenu de ce formulaire sera accessible dans le hash params
      # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    end
  
    def destroy
      # Méthode qui récupère le potin concerné et le détruit en base
      # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    end
end
