class RecipesController < ActionController::Base
  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @user = current_user
      @recipes = @user.recipes.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @inventories = Inventory.where(user_id: @current_user.id) if user_signed_in?
  end

  def create_shopping_list
    @recipe = Recipe.find(params[:recipe_id])
    @inventory_id = params[:inventory]
    redirect_to("/inventories/compare/#{@recipe.id}/#{@inventory_id}")
  end

  def new
    @user = current_user
    @recipe = @user.recipes.new
  end

  def create
    @user = current_user
    recipe = @user.recipes.new(recipe_params)
    respond_to do |format|
      format.html do
        if recipe.save
          redirect_to recipe_path(recipe)
          flash[:success] = 'Recipe was created!'
        else
          flash.now[:error] = 'Error: Recipe could not be created'
          render :new
        end
      end
    end
  end

  def destroy
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipe_path
    flash[:success] = 'Recipe was deleted!'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :public, :description)
  end
end
