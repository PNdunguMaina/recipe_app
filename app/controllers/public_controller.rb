class PublicController < ActionController::Base
  def index
    @recipes = Recipe.includes(:recipe_foods).where(public: true).order('created_at DESC')
  end
end
