class ApplicationController < ActionController::Base
    add_flash_types :success, :error, :warning, :info
    include ApplicationHelper
    
    unless Rails.application.config.consider_all_requests_local
        rescue_from ActionController::RoutingError, with: -> { render_404  }
      end
    
      def render_404
        respond_to do |format|
          format.html { render template: 'errors/not_found', status: 404 }
          format.all { render nothing: true, status: 404 }
      end
    end

    def set_as_lender
        current_user.is_lender = true
    end

end
