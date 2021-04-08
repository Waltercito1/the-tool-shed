class ReservationsController < ApplicationController
    before_action :find_reservation, only: [:show, :edit, :update, :destroy]
    
    def new 
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.create(reservation_params)
        #current_user.reservations.create(reservation_params)
        if @reservation.valid? #current_user.reservations.last.valid?
            redirect_to @reservation #current_user.reservations.last 
        else
            render :new
        end
    end

    def show
        find_reservation 
    end

    private

    def reservation_params
        params.require(:reservation).permit(:check_in, :check_out)
    end

    def find_reservation
        @reservation = Reservation.find_by_id(params[:id])
    end

end
