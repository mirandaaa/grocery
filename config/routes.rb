Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :welcome, only: :index
  resources :grocery_lists
  post '/grocery_lists/:id/add', to: 'grocery_lists#add_item'
end
