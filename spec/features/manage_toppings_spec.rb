require 'rails_helper'

RSpec.describe 'Manage Toppings', type: :feature do
  scenario 'list all toppings' do
    Topping.create!(name: 'Pepperoni')
    Topping.create!(name: 'Mushrooms')

    visit toppings_path

    expect(page).to have_content('Pepperonis')
    expect(page).to have_content('Mushrooms')
  end
end
