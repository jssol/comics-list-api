Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :events
  resources :comics
  post "/signup", to: "users#create"
  post "/delete-account", to: "users#destroy"
  post "/login", to: "sessions#create"
  get "/profile", to: "sessions#show"

  get '/search', to: 'comics#search'
end
