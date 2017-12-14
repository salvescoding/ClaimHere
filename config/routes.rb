Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:edit, :update, :destroy]
  get '/profile', to: 'users#show'

  resources :complaints, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  resources :companies do
    resources :complaints, only: [:new, :create]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
