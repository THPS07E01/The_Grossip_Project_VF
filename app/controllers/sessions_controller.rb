class SessionsController < ApplicationController

def create
  user = User.find_by(email: params[:user_email])

  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  if user && user.authenticate(params[:user_password])
    session[:user_id] = user.id
    flash[:success] = "Salut à toi #{current_user.username} ! Tu es maintenant connecté!"
    redirect_to gossips_path
  else
    flash[:danger] = "Erreur : mauvais email ou mauvais password. (ou alors c'est toi qui est mauvais ;) )"
    render 'new'
    flash.delete(:danger)

  end
end

def new
end

def destroy
  session.delete(:user_id)
  redirect_to root_path
end

end