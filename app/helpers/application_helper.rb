module ApplicationHelper

    def current_user #memoization
        @current_user ||= Contributor.find_by(id: session[:contributor_id])

    end

    def logged_in?
        current_user
    end
end
