Rails.application.routes.draw do
  resources :toppings, only: [:index, :show, :new, :create]
end
