module ListingsHelper
    
    def display_status_form(r)
         tag.h4 class:"reservation-details" do
            concat form_with(url: '/confirm_reservation') do |f|
                #f.hidden_field :reservation_id, r.id    
            concat f.submit format_button(r)
            end
        end.html_safe
    end
    
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