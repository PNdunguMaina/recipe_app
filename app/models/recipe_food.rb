class RecipeFood < ApplicationRecord
    belongs_to :recipe, foreign_key: :recipe_id, class_name: 'Recipe'
    belongs_to :food
  
  
  
    def self.value(id)
      recipe_food = RecipeFood.find(id)
      food = recipe_food.food
      food.price * recipe_food.quantity
    end
  end
  