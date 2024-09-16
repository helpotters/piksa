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

  scenario 'create a new pizza with toppings' do
    pizza_chef = User.create!(email: 'chef@pizza.com', password: 'i<3pizza', role: 'pizza_chef')
    sign_in pizza_chef

    cheese = Topping.create!(name: 'Cheese')
    pepperoni = Topping.create!(name: 'Pepperoni')

    visit new_pizza_path

    check 'Cheese'
    check 'Pepperoni'

    fill_in 'Name', with: 'Hawaiian'
    click_button 'Create Pizza'

    expect(page).to have_content('Hawaiian')
    expect(page).to have_content('Cheese')
    expect(page).to have_content('Pepperoni')
  end

  scenario 'delete an existing pizza' do
    pizza_chef = User.create!(email: 'chef@pizza.com', password: 'i<3pizza', role: 'pizza_chef')
    sign_in pizza_chef

    pizza = Pizza.create!(name: 'Margherita')

    visit pizzas_path
    find("#delete-pizza-#{pizza.id}").click

    expect(page).not_to have_content('Margherita')
    expect(Pizza.count).to eq(0)
  end

  scenario 'update an existing pizza and its toppings' do
    pizza_chef = User.create!(email: 'chef@pizza.com', password: 'i<3pizza', role: 'pizza_chef')
    sign_in pizza_chef

    # Create a pizza with existing toppings
    cheese = Topping.create!(name: 'Cheese')
    pepperoni = Topping.create!(name: 'Pepperoni')
    pizza = Pizza.create!(name: 'Margherita', toppings: [cheese])

    # Visit the edit page for the pizza
    visit edit_pizza_path(pizza)

    # Update the pizza name and modify toppings
    fill_in 'Name', with: 'Extra Cheesy'
    uncheck 'Cheese'   # Remove Cheese
    check 'Pepperoni'  # Add Pepperoni
    click_button 'Update Pizza'

    # Expectations: check that the pizza was updated correctly
    expect(page).to have_content('Extra Cheesy')  # Updated pizza name
    expect(page).to have_content('Pepperoni')    # Updated topping
    expect(page).not_to have_content('Cheese')   # Removed topping
  end
  scenario 'prevent duplicate pizza names' do
    pizza_chef = User.create!(email: 'chef@pizza.com', password: 'i<3pizza', role: 'pizza_chef')
    sign_in pizza_chef

    Pizza.create!(name: 'Margherita')

    visit new_pizza_path
    fill_in 'Name', with: 'Margherita'
    click_button 'Create Pizza'

    expect(page).to have_content('has already been taken')
  end
end
