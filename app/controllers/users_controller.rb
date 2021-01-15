class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
    end
    
    def edit
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
    end

    def update
    end

    private

    def user_params
        params.require(:user).permit(
            :name,
            :height,
            :happiness,
            :nausea,
            :tickets,
            :password,
            :admin
        )
    end
    
    def redirect_if_not_logged_in
        redirect_to root_path if session[:user_id] == nil
    end
end
