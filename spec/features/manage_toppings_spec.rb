require 'rails_helper'

RSpec.describe 'Manage Toppings', type: :feature do
  scenario 'list all toppings' do
    Topping.create!(name: 'Pepperoni')
    Topping.create!(name: 'Mushroom')

    visit toppings_path

    expect(page).to have_content('Pepperoni')
    expect(page).to have_content('Mushroom')
  end
end
