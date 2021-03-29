Rails.application.routes.draw do
  get '/search' => 'products#search', :as => 'search'
  get '/admin' => 'admin#index', :as => 'admin'

  resources :brands do
    resources :products, controller: 'brands/products'
  end

  resources :products do
    resources :variants
  end

  resources :products
  root 'admin#index'
end
