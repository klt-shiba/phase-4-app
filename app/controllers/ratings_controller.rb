class RatingsController < ApplicationController

    def new
        @rating = Rating.new
        @poster = Poster.find_by(id: params[:poster_id])
    end

    def show
    end

    def create
        @rating = Rating.new(rating_params)
        @poster = Poster.find_by(id: params[:poster_id])
        bidder = current_user.bidder

        @poster.ratings << @rating
        bidder.ratings << @rating


        if @rating.save

            
            redirect_to root_path
        else 
            puts "Not working"
            render :new
        end

    end

    private


    def rating_params
        params.require(:rating).permit(:rating)
      end
    
end