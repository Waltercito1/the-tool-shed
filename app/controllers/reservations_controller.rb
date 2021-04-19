class ReservationsController < ApplicationController
    before_action :find_reservation, only: [:show, :edit, :update, :destroy]
    
    def new 
        @reservation = Reservation.new
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.listing_id = params["listing_id"]
        @reservation.borrower_id = current_user.id
        if @reservation.check_out_is_after_check_in
            flash[:error] = @reservation.errors.full_messages.to_sentence
            #byebug
        else
            #Listing.available(@reservation.check_in, @reservation.check_out)
            #byebug
            @reservation.save
            if !@reservation.id
            flash[:error] = "Something went wrong, please try again."
            end
        end
        redirect_to listing_path(params["listing_id"])
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
        change_reservation_status(params)
    end

    private

    def reservation_params
        params.require(:reservation).permit(:check_in, :check_out, :status, :listing_id)
    end

    def find_reservation
        @reservation = Reservation.find_by_id(params[:id])
    end

end