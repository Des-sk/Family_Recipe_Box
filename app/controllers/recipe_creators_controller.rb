class RecipeCreatorsController < ApplicationController

   


    def new
        @recipe_creator = RecipeCreator.new
    end

    
    def index
        @recipe_creators = RecipeCreator.all
    end


    def show
        @recipe_creator = RecipeCreator.find_by(id:params[:id])
        
    end


    
    

    private 

      def recipe_creator_params
        params.require(:recipe_creator).permit(:name, :phone_number, :secret_ingredient, :recipe_id)
      end 
    
end
