Rails.application.routes.draw do
  get '/search' => 'products#search', :as => 'search'

  resources :brands do
    scope module: :brands do
      resources :products
    end
  end

  resources :products do
    scope module: :products do
      resources :variants
    end
    get :search, on: :collection
  end

  resources :categories do
    scope module: :categories do
      resources :products
    end
  end

  root 'admin#index'
end
