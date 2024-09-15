class CreateToppings < ActiveRecord::Migration[7.1]
  def change
    create_table :toppings do |t|
      t.string :name

      t.timestamps
    end
    add_index :toppings, :name, unique: true
  end
end
