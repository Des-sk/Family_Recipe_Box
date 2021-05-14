class RecipeCreatorsController < ApplicationController

   


    def new
        @recipe_creator = RecipeCreator.new
    end

    # def create
    #     @recipe_creator = RecipeCreator.new(recipe_creator_params)
    #     if @recipe_creator.save
    #         redirect_to recipe_creator_path(@recipe_creator)
    #     else
    #         render :new
    #     end
    # end
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
