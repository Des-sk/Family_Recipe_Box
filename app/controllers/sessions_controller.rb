class SessionsController < ApplicationController

    def new # render the login form 
        if logged_in?
            redirect_to root_path
        end
    end

    def create #processing login form
        contributor = Contributor.find_by(email: params[:email])
        if contributor && contributor.authenticate(params[:password])
            session[:contributor_id] = contributor.id
            redirect_to root_path
        else
            render :new
        end
         
    end

    def destroy #logout
        session.delete :contributor_id
        redirect_to login_path
    end

    def omniauth 
        contributor = Contributor.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |c|
          c.name = request.env['omniauth.auth'][:info][:first_name]
          c.email = request.env['omniauth.auth'][:info][:email]
          c.password = SecureRandom.hex(15)
        end 
        if user.valid?
          session[:contributor_id] = contributor.id # log them 
          redirect_to root_path
        else
          redirect_to login_path 
        end 
      end 
end