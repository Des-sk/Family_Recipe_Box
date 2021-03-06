class ContributorsController < ApplicationController

    def index
        @contributors = Contributor.contribs_recipes
    end
    
    
    def new # render a signup form
        if !logged_in?
            @contributor = Contributor.new
            render action: "new", layout: false
        else 
            redirect_to recipes_path
        end
    end 

    def create
        @contributor = Contributor.new(contributor_params)
        if @contributor.save
            session[:contributor_id] = @contributor.id
            redirect_to recipes_path
        else
            render :new
        end
    end



    



    private

    def contributor_params
        params.require(:contributor).permit(:name, :email, :password)
    end


end
