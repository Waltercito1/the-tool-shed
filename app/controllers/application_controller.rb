class ApplicationController < ActionController::Base
    add_flash_types :success, :error, :warning, :info
    include ApplicationHelper

    def set_as_lender
        current_user.is_lender = true
    end

    # def reserved_by_current_user
    #     Listing.reservations.select do |reservation|
    #       reservation.borrower_id == current_user.id
    #     end
    # end
    # def check_if_listing_available(start_date, end_date)
    #     Listing.available(start_date, end_date)
    # end

end
