class InventoryFoodsController < ApplicationController
  def new
    @inventory = Inventory.find(params[:inventory_id])
    @foods = Food.all
    @inventory_food = InventoryFood.new
  end

  def create
    @inventory = Inventory.find(params[:_id])
    inventory_food = @inventory.inventoryFoods.create(recipe_params)
    respond_to do |format|
      format.html do
        if inventory_food.save
          flash[:success] = 'Food was added to inventory!'
          redirect_to @inventory
        else
          flash.now[:error] = 'Error! Food was not added to inventory!'
          render :new
        end
      end
    end
  end

  def edit
    @inventory = Inventory.find(params[:inventory_id])
    @foods = Food.all
    @inventory_food = InventoryFood.find(params[:id])
  end

  def update
    @inventory_food = InventoryFood.find(params[:id])
    if @inventory_food.update(new_params)
      flash[:success] = 'Food was updated!'
    else
      flash[:error] = 'Error! Food was not updated!'
    end
    redirect_to inventory_path(@inventory_food.inventory_id)
  end

  def destroy
    @inventory_food = Inventory.find(params[:inventory_id])
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy
    redirect_to @inventory
    flash[:success] = 'Food was deleted from inventory!'
  end

  private

  def inventory_params
    params.require(:inventory_food).permit(:quantity, :food_id)
  end

  def new_params
    params.require(:inventory_food).permit(:quantity, :food_id)
  end
end
