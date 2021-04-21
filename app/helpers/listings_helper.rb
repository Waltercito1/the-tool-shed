module ListingsHelper
    
    def format_button(r)
        case r.status
        when "Pending"
            "Confirm Reservation"
        when "Confirmed"
            "Cancel Reservation"
        when "Cancelled"
            "Revert Status to Pending"
        end
    end

end