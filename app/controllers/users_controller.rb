
require 'pry'

class UsersController < ApplicationController

    before_action :set_user, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        
    end

    def index
        
    end

    private

    def user_params
        params.require(:user).permit(:role,:name,:email,:password,:school_id)
    end

end
