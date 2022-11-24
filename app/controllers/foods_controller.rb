class FoodsController < ApplicationController
  def index
    @user = current_user
    @foods = @user.foods.all
  end

  def new
    @user = current_user
    @food = @user.foods.new
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
    @user = current_user
    food = @user.foods.new(food_params)
    food.save
    redirect_to foods_path
  end

  def destroy
    @user = current_user
    @food = @user.foods.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
