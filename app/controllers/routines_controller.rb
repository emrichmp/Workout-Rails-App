class RoutinesController < ApplicationController

    def new
        @routine = Routine.new
    end

    def create
        @routine = Routine.new(user_params)
        if @routine.save
            redirect_to routines_path
        else
            render :new
        end
    end

    private
    #strong params
    def user_params
        params.require(:routine).permit(:day)
    end
end
