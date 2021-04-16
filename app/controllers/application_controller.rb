class ApplicationController < ActionController::Base
    add_flash_types :success, :error, :warning, :info
    include ApplicationHelper

    def set_as_lender
        current_user.is_lender = true
    end

end
