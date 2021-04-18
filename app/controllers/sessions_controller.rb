class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]

    def new
        @user = User.new
    end

    def create
      byebug
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to user
        else
          redirect_to '/login', error: "Invalid credentials, plese try again."
        end
    end

    def omniauth
      @user = User.from_omniauth(auth)
      #byebug
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to @user
      else
        render :new
      end
    end

    def destroy
        session.clear
        redirect_to "/login"
    end
    
    private

    def auth
      request.env['omniauth.auth']
    end

end