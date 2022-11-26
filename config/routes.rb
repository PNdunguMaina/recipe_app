Rails.application.routes.draw do
  resources :recipes, only: [:index, :new, :show, :destroy, :create] do
    resources :recipe_foods
    end
  devise_for :users
  resources :homes
  resources :foods
  get '/public_recipes', to: 'recipes#public'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#public"
end
