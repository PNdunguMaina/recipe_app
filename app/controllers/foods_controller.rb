class FoodsController < ApplicationController
  def index
<<<<<<< HEAD
    @user = current_user
    @foods = @user.foods.all
=======
    @foods = Food.where(user_id: current_user.id)
>>>>>>> 821f7f2f4540cff94fdfd50f2ae921edfa1cb83c
  end

  def new
    @user = current_user
    @food = @user.foods.new
  end

  def show
    @food = Food.find(params[:id])
  end

  def create
<<<<<<< HEAD
    @user = current_user
    food = @user.foods.new(food_params)
    food.save
    redirect_to foods_path
=======
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
>>>>>>> 821f7f2f4540cff94fdfd50f2ae921edfa1cb83c
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
