Rails.application.routes.draw do
  devise_for :users
  resources :toppings, only: [:index, :show, :new, :create]
  root to: "toppings#index"
end
