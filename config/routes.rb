Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :welcome, only: :index
  resources :grocery_lists
  resources :recipes
  post '/grocery_lists/:id/add', to: 'grocery_lists#add_item'
  get '/grocery_lists/:id/delete/:item_id', to: 'grocery_lists#delete_item', as: 'delete_item'
  post '/recipes/:id/add', to: 'recipes#add_ingredient'
  get '/recipes/:id/delete/:item_id', to: 'recipes#delete_ingredient', as: 'delete_ingredient'

end
