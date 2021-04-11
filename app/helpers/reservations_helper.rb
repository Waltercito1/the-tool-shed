module ReservationsHelper
    def reservations_pending_approval
        collection = []
        current_user.reservations.pending_approval.each do |r|
            #byebug
            collection << Listing.find_by_id(r.listing_id)
        end
        collection
    end
end
