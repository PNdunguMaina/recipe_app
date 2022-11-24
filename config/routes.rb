Rails.application.routes.draw do
  devise_for :users
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :destroy, :show] do
    resources :recipe_foods, only: [:new, :edit, :create, :destroy, :update]
  end
  resources :public, only: [:index]
  resources :general, only: [:index]


  # Defines the root path route ("/")
  # root "articles#index"
end
