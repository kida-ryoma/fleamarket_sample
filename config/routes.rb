Rails.application.routes.draw do
devise_for :users, controllers: {
  registrations: 'users/registrations',
}
devise_scope :user do
  get "users", to: "user/registrations#new"
  post "users", to: "user/registrations#create"
  get "users/sign_up/credit_card", to: "users/registrations#new_credit_card"
  post "users/sign_up/credit_card", to: "users/registrations#create_credit_card"
  get "users/sign_up/phone_number", to: "users/registrations#new_phone_number"
  post "users/sign_up/phone_number", to: "users/registrations#create_phone_number"
  get "users/sign_up/address", to: "users/registrations#new_address"
  post "users/sign_up/address", to: "users/registrations#create_address"
  get "users/sign_up/done", to: "users/registrations#done"
  post "users/sign_up/done", to: "users/registrations#done"
end
root to: "homes#index"

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
