class ApplicationController < ActionController::Base

    private

    def current_user
        session[:teacher_id] || session[:student_id]
    end
end
