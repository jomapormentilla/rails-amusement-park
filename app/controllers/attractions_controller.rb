class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
        @user = User.find_by_id(session[:user_id])
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :new
        end
    end

    def show
        @attraction = Attraction.find(params[:id])
        @ride = Ride.new
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])

        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            render :edit
        end
    end

    private

    def attraction_params
        params.require(:attraction).permit(
            :name,
            :height,
            :happiness,
            :nausea,
            :tickets
        )
    end
end
