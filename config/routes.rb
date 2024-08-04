Rails.application.routes.draw do

  resources :users, only: [:create, :show, :update, :destroy]

  resources :carbon_footprints, only: [:index, :show, :create, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
