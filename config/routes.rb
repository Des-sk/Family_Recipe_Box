Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'contributors#new'

  resources :recipe_creators
  resources :recipes
  resources :contributors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
