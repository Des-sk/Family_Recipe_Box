class ContributorsController < ApplicationController

    def new
        @contributor = Contributor.new
    end

    def create
        @contributor = Contributor.new(contributor_params)
        if @contributor.save
            session[:contributor_id] = @contributor.id
            redirect_to contributor_path(@contributor)
        else
            render :new
        end
    end

    def show
        @contributor = Contributor.find_by_id(params[:id])
        redirect_to '/' if !@contributor
    end



    private

    def contributor_params
        params.require(:contributor).permit(:name, :email, :password)
    end


end
