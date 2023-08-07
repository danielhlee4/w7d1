class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            login!(@user)
            redirect_to user_url(@user.id)
        else
            @user = User.new(username: params[:user][:username])
            render :new
        end
    end
end
