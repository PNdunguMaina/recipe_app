class InventoryController < ActionController::Base

    def index
      if current_user.nil?
        redirect_to new_user_session_path
      else
        @user = current_user
        @inventories = @user.inventories.all  
      end
    end
  
    def show
      @inventory = Inventory.find(params[:id])
    end
  
    def new
      @user = current_user
      @inventory = @user.inventories.new
    end
  
    def create
      @user = current_user
      recipe = @user.recipes.new(iventory_params)
      respond_to do |format|
        format.html do
          if iventory.save
            redirect_to iventory_path(iventory)
            flash[:success] = 'Iventory was created!'
          else
            flash.now[:error] = 'Error: Recipe could not be created'
            render :new
          end
        end
      end
    end
    
    def destroy
      @user = current_user
      @iventories = @user.iventories.find(params[:id])
      @iventory.destroy
      redirect_to iventory_path
      flash[:success] = 'Iventory was deleted!'
    end
  
    private
    
    def recipe_params
      params.require(:recipe).permit(:name, :description)
    end
    
  
  end
  