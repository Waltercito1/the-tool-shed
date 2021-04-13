module ApplicationHelper

    def display_list_conditionally(collection)
        if collection.length == 0
            content_tag(:h4, "There is currently nothing to list here.", class: "no-listings")
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
        #byebug
        render partial: "listings/errors", locals: {object: object} if object.errors.any?
    end

    def reservations_pending_approval
        current_user.reservations.pending_approval.map do |r|
            Listing.find_by_id(r.listing_id)
        end
    end

    def find_and_confirm
        
    end
    
end
