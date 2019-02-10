class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  respond_to :js, :json, :html

  def index
    @gossip_id = params[:id]
  end

  def new
  end
  
  def create
    #Création du gossip
    @gossip = Gossip.new(user_id: current_user.id, title: params['gossip_title'], content: params['gossip_content'])
    if @gossip.save     # si ça marche, il redirige vers la page d'index du site
      flash[:success] = "Bien joué #{current_user.username}! Ton Grossip a été ajouté!"
      redirect_to gossips_path
    else      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash[:danger] = 'Une erreur est survenue.'
      render 'new'
      flash.delete(:danger)
    end
  end

  def show
    set_gossip
    @gossip_id = params[:id]
    @gossip_user_username = Gossip.find(params[:id]).user.username
    @gossip_user_id = Gossip.find(params[:id]).user.id
    @gossip_title = Gossip.find(params[:id]).title
    @gossip_content = Gossip.find(params[:id]).content
    @gossip_created_at = Gossip.find(params[:id]).created_at
  end

  def edit
    set_gossip
  end

  def update
    set_gossip
    if post_params = params.require(:gossip).permit(:title, :content)
      @gossip.update(post_params)
      flash[:success] = 'Grossip édité avec succès!'
      redirect_to :gossip
    else
      flash[:danger] = 'Une erreur est survenue.'
      render :edit
      flash.delete(:danger)
    end
  end

  def destroy
    set_gossip
    @gossip.destroy
    redirect_to gossips_path
  end

  def vote
    set_gossip
    if !current_user.liked? @gossip
      @gossip.liked_by current_user
    elsif current_user.liked? @gossip
      @gossip.unliked_by current_user
    end
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:id])
  end
end
