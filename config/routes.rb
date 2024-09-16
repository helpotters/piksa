Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :toppings, only: [:index, :show, :new, :create, :destroy, :edit]
  resources :pizzas
  root to: "home#index"
end
