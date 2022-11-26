class Recipe < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  belongs_to :user

  validates :name, presence: true

  def count_total_price
    total = 0
    recipe_foods.each do |rf|
      food = Food.find(rf.food_id)
      total += food.price
    end
    total
  end

  def count_total_food_items
    recipe_foods.sum('quantity')
  end
end
