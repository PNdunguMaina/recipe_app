Rails.application.routes.draw do
  devise_for :owners
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root :to => "inventoryfoods#index"
  
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   resources :foods, only: [:index, :new, :create, :destroy]
   resources :recipes, only: [:index, :new, :create, :destroy, :show] do
     resources :recipe_foods, only: [:new, :edit, :create, :destroy, :update]
   end

   resources :inventory, only: [:index, :new, :create, :destroy, :show] do
    resources :inventory_foods, only: [:new, :edit, :create, :destroy, :update]
  end

   resources :public, only: [:index]
   resources :general, only: [:index]

end
