module ListingsHelper
    
    # def reservation_for_listing(object)
    #     #byebug
    #     object.reservations
    # end

    # def display_buttons_conditionally(object, r)
    #     <% if current_user.id == object.lender.id && r.status == "pending" %>
    #         <h4 class="reservation-details">  
    #             <%= form_with(url: '/confirm_reservation') do |f| %>
    #             <%= hidden_field :reservation_id, r.id %>
    #             <%= f.submit "Confirm Reservation" %></h4>
    #         <% end %>
    #     <% else %>
    #         <h4 class="reservation-details">  
    #             <%= form_with(url: '/confirm_reservation') do |f| %>
    #             <%= hidden_field :reservation_id, r.id %>
    #             <%= f.submit "Cancel Reservation" %></h4>
    #         <% end %>
    #     <% end %>
    # end
        
end