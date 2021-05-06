class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
        @recipe.build_recipe_creator  #for the _attributes- doesnt inter. with the writer method/ tell eah other about each other
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.contributor_id = session[:contributor_id]
        if @recipe.save!
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end 





    private

    def recipe_params
        params.require(:recipe).permit(:title, :ingredients, :directions, :contributor_id, :recipe_creator_id, recipe_creator_attributes: [:name, :phone_number, :secret_ingredient])
    end
end
 