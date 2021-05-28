Rails.application.routes.draw do
  root to: 'application#welcome'
  get '/signup' => 'contributors#new'
  post '/signup' => 'contributors#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  resources :contributors
  
  resources :recipes
  
  resources :recipe_creators do 
    resources :recipes, only: [:index, :show, :new, :create] 
  end 
  
end
