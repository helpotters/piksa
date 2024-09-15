require 'rails_helper'

RSpec.describe Topping, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      topping = Topping.new(name: '')
      expect(topping).not_to be_valid
    end

    it 'validates uniqueness of name' do
      Topping.create!(name: 'Pepperoni')
      duplicate_topping = Topping.new(name: 'Pepperoni')
      expect(duplicate_topping).not_to be_valid
    end
  end
end
