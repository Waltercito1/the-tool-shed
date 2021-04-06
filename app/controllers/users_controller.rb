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
        @user = current_user
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
