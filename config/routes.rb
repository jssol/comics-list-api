Rails.application.routes.draw do
  resources :events
  resources :comics
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/search', to: 'comics#search'
end
