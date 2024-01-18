class TheatresController < ApplicationController
    def index 
        @theatres = Theatre.all 
    end

    def create 
        @theatre = Theatre.new(theatre_params)
        if @theatre.save
            render json: @theatre
        else
            render json: "Error"
        end
    end

    
    

    private 
    def theatre_params
        params.permit(:name, :location, :movie_ids)
    end
end
