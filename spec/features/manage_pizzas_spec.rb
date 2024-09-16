require 'rails_helper'

RSpec.describe 'Manage Pizzas' do
  scenario 'list all pizzas and their toppings' do
    pizza_chef = User.create!(email: 'chef@pizza.com', password: 'i<3pizza', role: 'pizza_chef')
    sign_in pizza_chef

    pepperoni_pizza = Pizza.create!(name: 'Pepperoni Pizza')
    meat_lovers_pizza = Pizza.create!(name: 'Meat Lovers Pizza')

    pepperoni_topping = Topping.create!(name: 'Pepperoni')
    sausage_topping = Topping.create!(name: 'Sliced Sausage')

    pepperoni_pizza.toppings << pepperoni_topping
    meat_lovers_pizza.toppings << pepperoni_topping
    meat_lovers_pizza.toppings << sausage_topping

    visit pizzas_path

    expect(page).to have_content('Pepperoni Pizza')
    expect(page).to have_content('Meat Lovers Pizza')

    expect(page).to have_content('Pepperoni')
    expect(page).to have_content('Sliced Sausage')
  end

end
