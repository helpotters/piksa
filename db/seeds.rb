# Clear existing data
Topping.destroy_all
Pizza.destroy_all
User.destroy_all

# Create Toppings
cheese = Topping.create!(name: 'Cheese')
tomato = Topping.create!(name: 'Tomato')
pepperoni = Topping.create!(name: 'Pepperoni')
bacon = Topping.create!(name: 'Bacon')
mushrooms = Topping.create!(name: 'Mushrooms')
olives = Topping.create!(name: 'Olives')
onions = Topping.create!(name: 'Onions')

# Create Pizzas
Pizza.create!(name: 'Margherita', toppings: [cheese, tomato])
Pizza.create!(name: 'Pepperoni', toppings: [cheese, tomato, pepperoni])
Pizza.create!(name: 'Meat Lovers', toppings: [cheese, bacon, pepperoni])
Pizza.create!(name: 'Veggie Delight', toppings: [cheese, mushrooms, olives, onions])

# Create Users
store_owner = User.create!(
  email: 'owner@pizza.com',
  password: 'i<3pizza',
  role: 'store_owner'
)

pizza_chef = User.create!(
  email: 'chef@pizza.com',
  password: 'i<3pizza',
  role: 'pizza_chef'
)

