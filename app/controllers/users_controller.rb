class UsersController < ApplicationController
    skip_before_action :go_home, only: [:new,:create]

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
        if user
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            render "new"
        end 
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    


    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
    end

    
end
