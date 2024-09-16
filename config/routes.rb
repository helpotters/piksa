Rails.application.routes.draw do
  devise_for :users
  resources :toppings, only: [:index, :show, :new, :create]
end
