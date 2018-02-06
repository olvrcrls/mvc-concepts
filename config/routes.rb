Rails.application.routes.draw do
  get 'categories/index'

  devise_for :users
  root 'welcome#index'

  resources :brands
  resources :products do
  	resources :inventories
  end
  resources :inventories
  resources :categories
  resources :branches

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
