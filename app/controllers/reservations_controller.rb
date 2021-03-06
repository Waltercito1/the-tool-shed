class ReservationsController < ApplicationController
    before_action :find_reservation, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    
    def new
        if params[:listing_id]
           @reservation = Reservation.new(listing_id: params[:listing_id])
        end
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.listing_id = params["listing_id"]
        @reservation.borrower_id = current_user.id
        if @reservation.save
            flash[:success] = "Reservation created successfully."
            redirect_to @reservation
        else
            @listing = Listing.find_by_id(params["listing_id"])
            render :"listings/show"
        end

    end

    def index
        if params[:listing_id]
            @reservations = Reservation.reservations_of_listing(current_user.id, params[:listing_id])
        else
            @reservations = current_user.created_reservations
        end
    end

    def show
    end

    def edit
        if @reservation == nil
            flash[:error] = "Reservation not found."
            redirect_to '/'
        end
    end

    def update
        @reservation.update(reservation_params)
        if @reservation.valid?
            flash[:success] = "Reservation successfully updated."
            redirect_to @reservation 
        else
            render :edit
        end
    end

    def confirm
        change_reservation_status(params)
    end

    def destroy
        find_reservation.delete
        flash[:success] = "Reservation deleted successfully."
        redirect_to reservations_path
    end

    private

    def reservation_params
        params.require(:reservation).permit(:check_in, :check_out, :status, :listing_id)
    end

    def find_reservation
        @reservation = Reservation.find(params[:id])
    end

    def not_found
        flash[:error] = "Reservation not found. Please use the menu bar to find the resource you are looking for."
        redirect_to listings_path
    end

end