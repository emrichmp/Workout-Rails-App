class RoutinesController < ApplicationController

    def new
        @routine = Routine.new
    end

    def create
        @routine = current_user.routines.build(routine_params)
        if @routine.save
            redirect_to routines_path
        else
            render :new
        end
    end

    def index
        if params[:user_id] && user = User.find_by_id(params[:user_id])
            @routines = @current_user.routines
        end
    end

    private
    #strong params
    def routine_params
        params.require(:routine).permit(:day)
    end
end
