Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :items, only: [:index, :show, :new, :create] do
    resources :orders, only: [:new, :create]
  end
end
