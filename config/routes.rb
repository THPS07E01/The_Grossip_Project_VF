Rails.application.routes.draw do
  root 'static_pages#index'
  get 'contact', to: 'static_pages#contact'
  get 'team', to: 'static_pages#team'
  get 'users/:username', to: 'users#get_username', as: 'users'
  get 'view_user/:user_id', to: 'users#view_user', as: 'view_user'
  get 'gossips/:gossip_id', to: 'gossips#get_gossip_id', as: 'gossips'
  get 'create_gossip', to: 'gossips#create_gossip'
  post 'create_gossip', to: 'gossips#create_gossip_and_user'
end
