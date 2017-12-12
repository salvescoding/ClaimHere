Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:edit, :update, :destroy]

  resources :companies do
    resources :complaints, only: [:create, :destroy]
  end

  resources :complaints, only: [:index] do
    member do
      patch "solved", to: "complaints#solved"
      patch "ongoing", to: "complaints#ongoing"
      patch "unsolved", to: "complaints#unsolved"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
