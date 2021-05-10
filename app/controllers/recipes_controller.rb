class RecipesController < ApplicationController

    def index
        #if it is a nested route- its in our params- ifyou identify an id in params
        # render nested resource data
        if params[:recipe_creator_id] 
            @recipe_creator = RecipeCreator.find_by_id(params[:recipe_creator_id])#find recipe creator
            #rende all the recipes asociated with particular recioe creator
            @recipes = @recipe_creator.recipes 
        else
        @recipes = Recipe.all
        end
    end
   
   
   
    def new
        if params[:recipe_creator_id]
            @recipe_creator = RecipeCreator.find_by_id(params[:recipe_creator_id])
            @recipe = @recipe_creator.recipes.build  #for the _attributes- doesnt inter. with the writer method/ tell eah other about each other
        else
        @recipe = Recipe.new
        @recipe.build_recipe_creator
        end
    end

    def create 
        if params[:recipe_creator_id]
          @recipe_creator = RecipeCreator.find_by(id: params[:recipe_creator_id])
          @donation = @recipe_creator.recipes.build(recipe_params)
          @recipe.contributor_id = session[:contributor_id]
        else 
          @recipe = Recipe.new(recipe_params)
          @recipe.contributor_id = session[:contributor_id]
        end 
    
        if @recipe.save 
            redirect_to recipe_creator_recipes_path(@recipe.recipe_creator)
        else 
          render :new
        end 
    end
    # def create
    #     @recipe = Recipe.new(recipe_params)
    #     @recipe.contributor_id = session[:contributor_id]
    #     if @recipe.save
    #         redirect_to recipe_path(@recipe)
    #     else
    #         render :new
    #     end
           
    #     if params[:recipe_creator_id]
    #         @recipe_creator = RecipeCreator.find_by(id: params[:recipe_creator_id])
    #         @recipe = @recipe_creator.recipes.build(recipe_params)
    #         @recipe = Recipe.new(recipe_params)
    #         @recipe.contributor_id = session[:contributor_id]
    #         @recipe.save
    #         redirect_to recipe_creator_recipes_path(@recipe.recipe_creator)
    #     end 
    # end 

    # def create 
    #     if params[:recipe_creator_id]
    #       @recipe_creator = RecipeCreator.find_by(id: params[:recipe_creator_id])
    #       @recipe = @recipe_creator.recipes.build(recipe_params)
    #     else 
    #       @recipe = Recipe.new(recipe_params)
    #         @recipe.contributor_id = session[:contributor_id]
    #     end 
    
    #     if @recipe.save
    #       redirect_to recipe_path(@recipe)
    #     else 
    #       render :new
    #     end 
    #   end 
    
    

    def show
        @recipe = Recipe.find_by_id(params[:id])
    end

    def edit 
        @recipe = Recipe.find_by_id(params[:id])
    end

    def update
        @recipe = Recipe.find_by_id(params[:id])
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        end
    end

    def destroy
        @recipe = Recipe.find_by_id(params[:id])
        @recipe.destroy
        redirect_to recipes_path
    end

    






    private

    def recipe_params
        params.require(:recipe).permit(:title, :ingredients, :directions, :contributor_id, :recipe_creator_id, recipe_creator_attributes: [:name, :phone_number, :secret_ingredient])
    end
end
 