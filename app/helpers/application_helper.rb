module ApplicationHelper

    def display_list_conditionally(collection)
        if collection.length == 0
            content_tag(:h4, "There are currently no resources, go create one", class: "no-listings")
        else
            tag.div class: class_name(collection) do
                render collection
            end
        end
    end

    def class_name(collection)
        collection.first.class == Listing ? "listing table--3cols" : "table table--3cols"
    end

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

    def redirect_if_logged_in
        redirect_to user_path(session[:user_id]) if logged_in?
    end

    def conditional_errors(object)
        render partial: "errors/error", locals: {object: object} if object.errors.any?
    end
    
end
