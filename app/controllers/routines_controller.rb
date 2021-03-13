class RoutinesController < ApplicationController

    def new
        @routine = Routine.new
    end
end
