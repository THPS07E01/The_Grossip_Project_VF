class GossipsController < ApplicationController

  def index
    @gossip_id = params[:id]
  end

  def new
  end
  
  def create

    User.create(username: params['gossip_username'])
    @gossip = Gossip.new(user_id: User.last.id, title: params['gossip_title'], content: params['gossip_content'])
    if @gossip.save     # si ça marche, il redirige vers la page d'index du site
      flash[:success] = 'It worked : Gossip successfully added!'
      redirect_to gossips_path
    else      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash[:danger] = 'Something went wrong.'
      render 'new'
      flash.delete(:danger)
    end
  end




  def show
    @gossip_id = params[:id]
    @gossip_user_username = Gossip.find(params[:id]).user.username
    @gossip_user_id = Gossip.find(params[:id]).user.id
    @gossip_title = Gossip.find(params[:id]).title
    @gossip_content = Gossip.find(params[:id]).content
    @gossip_created_at = Gossip.find(params[:id]).created_at
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @model = Model.find(params[:id])
    if @model.update(tes_params)
      redirect_to @model
    else
      render :edit
    end
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end
