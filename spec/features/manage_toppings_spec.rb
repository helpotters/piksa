require 'rails_helper'

RSpec.describe 'Manage Toppings', type: :feature do
  scenario 'list all toppings' do
    Topping.create!(name: 'Pepperoni')
    Topping.create!(name: 'Mushroom')

    visit toppings_path

    expect(page).to have_content('Pepperoni')
    expect(page).to have_content('Mushroom')
  end

  scenario 'add a new topping' do
    visit new_topping_path

    fill_in 'Name', with: 'Bell Peppers'
    click_button 'Create Topping'

    expect(page).to have_content('Bell Peppers')
    expect(Topping.count).to eq(1)
  end
end
