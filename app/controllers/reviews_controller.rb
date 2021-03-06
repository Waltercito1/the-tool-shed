class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def new
        if params[:listing_id]
            @review = Review.new(listing_id: params[:listing_id])
        end
    end

    def create
        @review = Review.create(review_params)
        @review.listing_id = params["listing_id"]
        @review.borrower_id = current_user.id
        @review.reservation_id = Reservation.find_reservation_for_review(current_user.id, params[:listing_id])
        #byebug
        if @review.save
            flash[:success] = "Thank You. Your review was created successfully"
            redirect_to @listing = Listing.find_by_id(params["listing_id"])
        else
            @listing = Listing.find_by_id(params["listing_id"])
            render :new
        end
    end

    def show
    end

    def index
        @reviews = Review.all
    end

    private

    def review_params
        params.require(:review).permit(:description, :rating, :borrower_id, :reservation_id, :listing_id)
    end

    def find_review
        @review = Review.find(params[:id])
    end

    def not_found
        flash[:error] = "Review not found. Please use the menu bar to find the resource you are looking for."
        redirect_to listings_path
    end

end
