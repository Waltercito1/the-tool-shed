class ListingsController < ApplicationController
    before_action :find_listing, only: [:show, :edit, :update, :destroy]

    def index
        if params["search"]
            @listings = Listing.search_by_name(params["search"])
        else
            @listings = Listing.all
        end
    end

    def show
        redirect_if_not_logged_in
        find_listing
    end

    def new 
        @listing = Listing.new
    end

    def create
        @listing = current_user.open_listings.create(listing_params)
        if @listing.valid?
            set_as_lender
            flash[:success] = "Listing created successfully."
            redirect_to @listing
        else
            render :new
        end
    end

    def edit
    end

    def update
        @listing.update(listing_params)
        if @listing.valid?
            flash[:success] = "Listing updated successfully."
            redirect_to @listing
        else
            render :edit
        end
    end

    def destroy
        if @listing.destroy
            flash[:success] = "Listing deleted successfully."
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
