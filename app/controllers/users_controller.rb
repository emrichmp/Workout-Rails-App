class UsersController < ApplicationController

    def index
        @users = User.all
    end

    #load signup form
    def new
        @user = User.new
    end
    #signup controller action
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to routines_path
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end

    private
    #strong params
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
