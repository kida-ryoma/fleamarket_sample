Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :items, only: [:index, :show]
  resources :signup, only: [:create] do
    collection do 
      get 'new'
      get 'user_registration1'
      get 'user_registration2'
      get 'user_registration3'
      get 'user_registration4'
      get 'done'
      get 'show'
    end
  end
  
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json'}
      get 'get_category_grandchildren', defaults: { format: 'json'}
    end
    resources :orders, only: [:new, :create]
    member do
      get 'destroy_confirmation'
    end
  end
  resources :users, only: [:show]
end
