class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :index]

    def new
        @review = Review.new
    end

    def create
        @review = Review.create(review_params)
    end

    def show
        find_review
    end

    def index
        @reviews = Review.all
    end

    private

    def review_params
        params.require(:review).permit(:description, :rating, :borrower_id, :reservation_id, :listing_id)
    end

    def find_review
        @review = Review.find_by_id(params[:id])
    end


end
