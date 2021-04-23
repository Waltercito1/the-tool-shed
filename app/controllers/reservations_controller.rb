class ReservationsController < ApplicationController
    before_action :find_reservation, only: [:show, :edit, :update, :destroy]
    
    def new
        if params[:listing_id]
           @reservation = Reservation.new(listing_id: params[:listing_id])
        end
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.listing_id = params["listing_id"]
        @reservation.borrower_id = current_user.id
        #byebug
        if @reservation.save
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
        find_reservation 
    end

    def edit
    end

    def update
        @reservation.update(reservation_params)
        if @reservation.valid?
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
        flash[:success] = "Reservation deleted successfully"
        redirect_to reservations_path
    end

    private

    def reservation_params
        params.require(:reservation).permit(:check_in, :check_out, :status, :listing_id)
    end

    def find_reservation
        @reservation = Reservation.find_by_id(params[:id])
    end

end