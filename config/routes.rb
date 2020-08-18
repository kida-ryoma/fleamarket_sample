Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
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
  resources :items, only: [:index, :show, :new, :create] do
    resources :orders, only: [:new, :create]
  end
  resources :users, only: [:show]
end
