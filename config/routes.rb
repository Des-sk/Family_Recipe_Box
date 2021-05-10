Rails.application.routes.draw do
  root to: 'application#welcome'
  get '/signup' => 'contributors#new'
  post '/signup' => 'contributors#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  resources :contributors
  # resources :recipe_creators do 
  #   resources :recipes, shallow: true 
  # end 
  # resources :recipes, only [:index, :new, :create]
  resources :recipes
  # only nested routes that we need are the index, new, create
  resources :recipe_creators do #7 resfull routs
    resources :recipes, only: [:index, :new, :create,] #need separate resource for not nested resources, but will crete 7 restful routes for NESTED res. 
  end 
  
 





# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
