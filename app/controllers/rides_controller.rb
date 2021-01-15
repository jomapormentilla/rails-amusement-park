class RidesController < ApplicationController
    def create
        @ride = Ride.find_or_create_by(ride_params)
        
        flash[:message] = @ride.take_ride
        redirect_to user_path(@ride.user)
    end    

    private
    
    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end
end
