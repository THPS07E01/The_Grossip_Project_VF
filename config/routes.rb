Rails.application.routes.draw do
  get 'cities/show'
  root 'static_pages#index'
  get 'contact', to: 'static_pages#contact'
  get 'team', to: 'static_pages#team'
  resources :gossips
  resources :users
  resources :cities
  resources :comments
end