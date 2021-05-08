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
            @recipe.build_recipe_creator
            render :new
        end
    end

    def index
        #if it is a nested route- its in our params- ifyou identify an id in params
        # render nested resource data
        if params[:recipe_creator_id] 
            @recipe_creator = RecipeCreator.find_by(params[:recipe_creator_id])#find recipe creator
            #rende all the recipes asociated with particular recioe creator
            @recipes =  @recipe_creator.recipes 
        else
        @recipes = Recipe.all
        end
    end
    
    def new
        @recipe = Recipe.new
        @recipe.build_recipe_creator  #for the _attributes- doesnt inter. with the writer method/ tell eah other about each other
    end

    

    def show
        @recipe = Recipe.find_by(id: params[:id])
    end

    






    private

    def recipe_params
        params.require(:recipe).permit(:title, :ingredients, :directions, :contributor_id, :recipe_creator_id, recipe_creator_attributes: [:name, :phone_number, :secret_ingredient])
    end
end
 