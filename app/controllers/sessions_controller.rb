class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]

    def new
        #byebug
        @user = User.new
    end

    def create
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to user
        else
          flash.now[:messages] = "Invalid credentials, plese try again."
          render controller: 'sessions', action: 'new'
        end
    end

    def destroy
        session.clear
        redirect_to "/login"
    end
end