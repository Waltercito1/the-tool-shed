class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
    before_action :find_user, only: [:edit, :update, :destroy]
    
    def new
        @user = User.new
        #byebug
    end

    def create
        #byebug
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        #current_user
        find_user
    end

    def edit
        #find_user
    end

    def update
        #find_user
        @user.update(user_params)
        if @user.valid?
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
        find_user.delete
        session[:user_id] = nil
        redirect_to '/'
        
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :street, :city, :state, :zipcode, :contact_info)
    end

    def find_user
        @user = User.find_by_id(params[:id])
    end

end
