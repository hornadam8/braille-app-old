
class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create

        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            school = School.find(params.require(:user).permit([:school_id])
            @user.role = params[:user][:role]
            @user.school = school
            @user.save
            redirect_to user_path(@user)
        else
            @user = User.new(user_params)
            render :new
        end

    end



    def logout
        session.clear
        redirect_to "/"
    end


end