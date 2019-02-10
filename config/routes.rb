Rails.application.routes.draw do
  root 'static_pages#index'
  get 'contact', to: 'static_pages#contact'
  get 'team', to: 'static_pages#team'
  
  resources :gossips do
    member do
      put 'like' => 'gossips#vote'
    end
  end
  resources :users
  resources :cities
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]
end