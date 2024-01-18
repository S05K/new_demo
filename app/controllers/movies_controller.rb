class MoviesController < ApplicationController


    def index 
        # debugger
        @movies = Movie.all
        render json: @movies
    end


    def create
        debugger
        @movie = Movie.new(movie_params)
        if @movie.save 
            render json: "Done"
        else
            render json: "Error"
        end
    end
    
    def show 
        debugger    
        @movie = Movie.find(params[:id])
        render json: @movie
    end




    #For showing theatres of a particular movie.....
     def theatres_for_movie
        # debugger
        @movie = Movie.find(params[:id])
        @theatres = @movie.theatres
        render json: @theatres
      end





    private
    def movie_params
        params.permit(:title, :description, :genre, :duration, :release_date, :theatre_ids)
    end
end
