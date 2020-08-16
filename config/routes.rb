Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get "users/sign_up/address", to: "users/registrations#new_address"
    post "users/sign_up/address", to: "users/registrations#create_address"
    get "users/sign_up/credit_card", to: "users/registrations#new_credit_card"
    post "users/sign_up/credit_card", to: "users/registrations#create_credit_card"
    get "users/sign_up/phone_number", to: "users/registrations#new_phone_number"
    post "users/sign_up/phone_number", to: "users/registrations#create_phone_number"
    get "users/sign_up/done", to: "users/registrations#done"
    post "users/sign_up/done", to: "users/registrations#done"
  end
  root to: "homes#index"
  resources :items, only: [:index, :show]
  # resources :sign_up, only: [:create] do
  #   collection do
  #     get 'new'
  #     get 'user_registration1'
  #     get 'user_registration2'
  #     get 'user_registration3'
  #     get 'user_registration4'
  #     get 'done'
  #   end
  # end
  resources :items, only: [:index, :show, :new, :create] do
    resources :orders, only: [:new, :create]
  end
end
