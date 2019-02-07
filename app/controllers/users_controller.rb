class UsersController < ApplicationController

  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def new
  end
  
  def create  # Inscription d'un nouvel user.
    city = City.new(name: params['user_city'], zipcode: rand(1..99999))
    save_city = true

    if City.find_by(name: params['user_city']) # Vérifie si la ville existe déjà dans la DB
      what_city_id = City.find_by(name: params['user_city']).id
      save_city = false
    else
      what_city_id = City.last.id + 1
    end

    #Création du user
      user = User.new(
    username: params['user_username'], 
    first_name: params['user_first_name'], 
    last_name: params['user_last_name'], 
    email: params['user_email'], 
    city_id: what_city_id,
    password: params['user_password'], 
    age: params['user_age'], 
    description: params['user_description']
    )

    if save_city == true
      if city.save && user.save
        redirect_to root_path(user.id)
      else
        render new_user_path
      end
    else
      if user.save
        flash[:success] = 'It worked : Gossip successfully added!'
        redirect_to new_session_path
      else
        flash[:danger] = 'Something went wrong.'
        render 'new'
        flash.delete(:danger)
      end
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
