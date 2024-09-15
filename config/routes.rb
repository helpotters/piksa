Rails.application.routes.draw do
  resources :toppings, only: [:index, :show]  # Defines both index and show routes
end
