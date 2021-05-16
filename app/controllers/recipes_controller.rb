class RecipesController < ApplicationController
    before_action :set_recipe, except: [:index, :new, :create]
    before_action :set_recipe_creator, only: [:index, :new, :create]


    def index
        if params[:recipe_creator_id] 
            @recipes = @recipe_creator.recipes 
            
        else
            @recipes = Recipe.all
        end
    end

   
    def new
        if params[:recipe_creator_id]
            @recipe = @recipe_creator.recipes.build  #for the _attributes- doesnt inter. with the writer method/ tell eah other about each other
        else
            @recipe = Recipe.new
            @recipe.build_recipe_creator
        end
    end


    def create 
        if params[:recipe_creator_id]
          @recipe = @recipe_creator.recipes.build(recipe_params)
          @recipe.contributor_id = session[:contributor_id]
        else 
          @recipe = Recipe.new(recipe_params)
          @recipe.contributor_id = session[:contributor_id]
        end
    
        if @recipe.save
            redirect_to recipe_path(@recipe)
            
        else 
          render :new
        end 
    end
   

    def show  
    end


    def edit  
    end


    def update
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        end
    end


    def destroy
        @recipe.destroy
        redirect_to recipes_path
    end

    

    private

    def recipe_params
        params.require(:recipe).permit(:title, :ingredients, :directions, :contributor_id, :recipe_creator_id, recipe_creator_attributes: [:name, :phone_number, :secret_ingredient])
    end

    def set_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end 

    def set_recipe_creator
        @recipe_creator = RecipeCreator.find_by(id: params[:recipe_creator_id])
    end
end
 