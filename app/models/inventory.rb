class Inventory < ApplicationRecord
    belongs_to :user, foreign_key: :user_id, class_name: 'User'
    has_many :inventory_foods, foreign_key: :inventory_id, dependent: :destroy
    has_many :foods, through: :inventory_foods
    
    validates :name, presence: true
    validates :description, presence: true
  
    def self.recent_inventries(id)
      inventory = Inventory.find(id)
      inventory_foods = inventory.recipeFoods
      @total = inventory_foods.map { |x| InventoryFood.value(x.id) }.reduce(:+)
      @total = if @total.nil?
                 0
               else
                 @total
               end
    end
  
    def self.items(id)
      inventory = Inventory.find(id)
      inventory.inventoryFoods.count
    end
  end
  