class ApplicationController < ActionController::Base

    private

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find(session[:user_id])
    end

    def set_user
        @user = User.find(params[:id])
    end

    def auth_student
        current_user.student_id == params[:id]
    end

    def auth_teacher
        current_user.teacher_id == params[:id]
    end

    def teacher_filter
        if !auth_student
            redirect_to logout_path
        end
    end


    def student_filter
        if !auth_student
            redirect_to logout_path
        end
    end

    def user_params
        params.require(:user).permit(:role,:name,:email,:password)
    end

end
