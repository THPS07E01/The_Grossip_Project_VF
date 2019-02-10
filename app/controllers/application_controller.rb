class ApplicationController < ActionController::Base
include SessionsHelper

private

def authenticate_user
  unless current_user
    flash[:danger] = "Veuillez vous connecter."
    redirect_to new_session_path
  end
end
end