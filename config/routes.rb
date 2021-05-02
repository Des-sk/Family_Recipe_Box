Rails.application.routes.draw do
  root to: 'application#welcome'
  get '/signup' => 'contributors#new'
  post '/signup' => 'contributors#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback', => 'sessions#omniauth'
  resources :contributors
  
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
