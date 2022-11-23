
class RecipeFood < ApplicationRecord
 belongs_to :user, foreign_key: :user_id, class_name: 'User'
 has_many :recipe_foods, foreign_key: :recipe_id, dependent: :destroy
 has_many :foods, through: :recipe_foods

validates :name, presence: true
validates :preparation_time, presence: true
validates :cooking_time, presence: true
validates :description, presence: true

def self.total_value(id)
  recipe = Recipe.find(id)
  recipe_foods = recipe.recipeFoods
  @total = recipe_foods.map { |x| RecipeFood.value(x.id) }.reduce(:+)
  @total = if @total.nil?
             0
           else
             @total
           end
end

def self.items(id)
  recipe = Recipe.find(id)
  recipe.recipeFoods.count
end
end

