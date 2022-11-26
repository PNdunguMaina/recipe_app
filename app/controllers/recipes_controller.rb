<<<<<<< HEAD
class RecipesController < ActionController::Base
  def index
    @user = current_user
    @recipes = @user.recipes.all
  end

  def show
    @recipe = Recipe.find(params[:id])
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
=======
class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
>>>>>>> 821f7f2f4540cff94fdfd50f2ae921edfa1cb83c
      end
    end
  end

<<<<<<< HEAD
  def destroy
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipe_path
    flash[:success] = 'Recipe was deleted!'
=======
  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])
    @public = @recipe.public ? false : true
    Recipe.update(@recipe.id, public: @public)
    redirect_to recipe_path
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def public
    @recipes = Recipe.where(public: true).order('created_at DESC')
>>>>>>> 821f7f2f4540cff94fdfd50f2ae921edfa1cb83c
  end

  private

<<<<<<< HEAD
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :public, :description)
=======
  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :cooking_time, :preparation_time, :public, :description)
>>>>>>> 821f7f2f4540cff94fdfd50f2ae921edfa1cb83c
  end
end
