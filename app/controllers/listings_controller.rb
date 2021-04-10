class ListingsController < ApplicationController
    before_action :find_listing, only: [:show, :edit, :update, :destroy]

    def index
        @listings = Listing.all
    end

    def show
        find_listing
    end

    def new 
        @listing = Listing.new
    end

    def create
        #byebug
        current_user.open_listings.create(listing_params)
        if current_user.open_listings.last.valid?
            redirect_to current_user.open_listings.last #, success: "Your New Listing Was Created Successfully!"
        else
            render :new
        end
    end

    def edit
    end

    def update
        #byebug
        current_user.open_listings.update(listing_params)
        #@listing.update(listing_params)
        if current_user.open_listings.last.valid? #@listing.valid?
            redirect_to @listing
        else
            render :edit
        end
    end

    def destroy
        if @listing.destroy
            redirect_to listings_path
        else
            redirect_to @listing
        end
    end

    private

    def listing_params
        params.require(:listing).permit(:title, :category, :description, :price)
    end

    def find_listing
        @listing = Listing.find_by_id(params[:id])
    end

end
