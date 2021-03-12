class UsersController < ApplicationController
    #load signup form
    def new
        @user = User.new
    end
    #signup controller action
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            #change this
            redirect_to routines_path
        else
            render :new
        end
    end

    private
    #strong params
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
