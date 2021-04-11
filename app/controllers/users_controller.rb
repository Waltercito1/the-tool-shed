class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        current_user
        #byebug
        #@pending_listings = Listing.pending_approval
        #byebug
        #@pending = current_user.open_listings.pending_approval
    end

    def edit
        find_user
    end

    def update
        find_user
        @user.update(user_params)
        if @user.valid?
            redirect_to @user
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :street, :city, :state, :zipcode, :contact_info)
    end

    def find_user
        @user = User.find_by_id(params[:id])
    end

end
