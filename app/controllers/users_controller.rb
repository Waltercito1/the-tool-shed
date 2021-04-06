class UsersController < ApplicationController
    #before_action :redirect_if_logged_in, only: [:new]
    
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
        @user = User.find_by_id(params[:id]) #current_user
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
