class SeatsController < ApplicationController

    def index
        # debugger
        @show = Show.find(params[:id])
        @seats = @show.seats
        render json: @seats.to_json(include: :show)
        # render json:"Done"
        Seat.transaction do
          debugger
          (1..10).each do |row|
            (1..10).each do |number|
              Seat.create!(seat_param)
            end
          end
        end
      end

    #   show = Show.find(params[:id])

    #   Seat.transaction do
    #     (1..10).each do |row|
    #       (1..10).each do |number|
    #         Seat.create!(row: row, number: number, show: show, theatre: show.theatre)
    #       end
    #     end
    #   end
  
      
    #   render json: { message: 'Seats created successfully' }
    # end
  

    def hello
      show=Show.find(params[:id])
      seat = show.seats.all
      render json: seat
    end

      private 
      def seat_param
        params.permit(:row, :number, :theatre_id, :show_id, :id)
      end


end
