Rails.application.routes.draw do
  devise_for :users
  resources :toppings, only: [:index, :show, :new, :create, :destroy, :edit]
  resources :pizzas
  root to: "toppings#index"
end
