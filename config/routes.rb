Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'sessions'
  }
  resources :users, only: [:show, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
