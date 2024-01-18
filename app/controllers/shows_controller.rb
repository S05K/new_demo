class ShowsController < ApplicationController


    def index
        @theatre = Theatre.find(params[:id])
        @shows = @theatre.shows
       render json:@shows
    end


end
