class SessionsController < ApplicationController

    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to "/users/#{@user.id}"
        else
            #add flash message here
            redirect_to '/'
        end
    end

    def google
        @user = User.find_or_create_by(username: auth["info"]["email"]) do |user|
            user.password = SecureRandom.hex(10)
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/users/#{@user.id}"
        else
            redirect_to '/'
        end
    end

    def home
    end

    #logout route
    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end