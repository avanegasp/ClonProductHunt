Rails.application.routes.draw do
  root 'products#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  delete 'logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create]
  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
