Rails.application.routes.draw do
  resources :recipe_creators
  resources :recipes
  resources :contributors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
