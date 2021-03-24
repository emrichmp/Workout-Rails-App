class RoutinesController < ApplicationController
        before_action :redirect_if_not_logged_in

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
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @routines = @user.routines
        end
    end

    def show
        @routine = Routine.find_by_id(params[:id])
    end

    def edit
        @routine = Routine.find_by_id(params[:id])
        redirect_to routine_path if !@routine || @routine.user != current_user
    end

    def update
        @routine = Routine.find_by(id: params[:id])
        redirect_to routines_path if !@routine || @routine.user != current_user
       if @routine.update(routine_params)
         redirect_to routine_path(@routine)
       else
         render :edit
       end
     end

    private
    #strong params
    def routine_params
        params.require(:routine).permit(:day)
    end
end
