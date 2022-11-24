class InventoryFood < ApplicationRecord
    belongs_to :inventory, foreign_key: :inventory_id, class_name: 'Inventory'
    belongs_to :food, foreign_key: :food_id, class_name: 'Food'
  
    def self.value(id)
      inventory_food = InventoryFood.find(id)
      food = inventory_food.food
      inventory_food.quantity
    end
  end
  