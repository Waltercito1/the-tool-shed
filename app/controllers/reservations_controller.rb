class ReservationsController < ApplicationController
    before_action :find_reservation, only: [:show, :edit, :update, :destroy]
    
    def new 
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.create(reservation_params)
        if @reservation.valid?
            redirect_to @reservation
        else
            render :new
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
            redirect_to @reservation #need to fix redirect_to current_user dashboard
        else
            render :edit
        end
    end

    def confirm
        #byebug
        reservation = Reservation.find_by_id(params[:reservation_id].keys.first)
        reservation.status = "Confirmed"
        reservation.save
        redirect_to listing_path(reservation.listing_id)
    end

    private

    def reservation_params
        params.require(:reservation).permit(:check_in, :check_out, :status, :listing_id)
    end

    def find_reservation
        @reservation = Reservation.find_by_id(params[:id])
    end

end