class RecipeCreatorsController < ApplicationController

    def index
        @recipe_creators = RecipeCreator.all
    end

    def new
        @recipe_creator = RecipeCreator.new
    end

    def create
        @recipe_creator = RecipeCreator.new(recipe_creator_params)
        if @recipe_creator.save
            redirect_to recipe_creator_path(@recipe_creator)
        else
            render :new_recipe_path
        end
    end

    private 

      def recipe_creator_params
        params.require(:recipe_creator).permit(:name, :phone_number, :secret_ingredient)
      end 
    
end
