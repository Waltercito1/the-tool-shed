module ApplicationHelper

    def display_list_conditionally(collection)
        if collection.length == 0
            content_tag(:h4, "There is currently nothing to list here.", class:"ml-3 mb-3 max-w-2xl text-sm text-red-700")
        else  
            render collection
        end
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
        if object != nil
        render partial: "listings/errors", locals: {object: object} if object.errors.any?
        end
    end
    
    def reservations_pending_approval
        current_user.reservations.pending_approval.map do |r|
            Listing.find_by_id(r.listing_id)
        end
    end
    
    def change_reservation_status(params)
        reservation = Reservation.find_by_id(params[:reservation_id].keys.first)
        case reservation.status
        when "Pending"
            reservation.status = "Confirmed"
        when "Confirmed"
            reservation.status = "Cancelled"
        when "Cancelled"
            reservation.status = "Pending"
        end
        reservation.save
        redirect_to listing_path(reservation.listing_id)
    end
    
end
