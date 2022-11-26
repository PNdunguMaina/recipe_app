Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  root :to => "foods#index"
  
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   resources :foods, only: [:index, :new, :create, :destroy]
   resources :recipes, only: [:index, :new, :create, :destroy, :show] do
     resources :recipe_foods, only: [:new, :edit, :create, :destroy, :update]
   end
  resources :inventories  do
    resources :inventory_foods, only: [:new, :edit, :create, :destroy, :update]
   end
   resources :public, only: [:index]
   resources :general, only: [:index]

   get '/recipes/:recipe_id/generate', to: 'recipes#create_shopping_list'
   post '/recipes/:recipe_id/generate', to: 'recipes#create_shopping_list'
   get '/inventories/compare/:recipes_id/:inventory_id', to: 'inventories#compare'
   post 'inventories/:inventory_id/add', to: 'inventories#add'
   post 'inventories/:inventory_id/remove/:inv_fod_id', to: 'inventories#remove'
end
