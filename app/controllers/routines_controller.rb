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
        #use of scope method here
        @routines = Routine.alpha
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

     def destroy
        Routine.find(params[:id]).destroy
        redirect_to routines_path
     end


    private
    #strong params
    def routine_params
        params.require(:routine).permit(:day)
    end
    
end
