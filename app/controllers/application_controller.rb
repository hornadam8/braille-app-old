class ApplicationController < ActionController::Base

    private

    def logged_in?
        !!session[:teacher_id] || !!session[:student_id]
    end

    def logged_in_as_teacher?
        !!session[:teacher_id]
    end

    def current_user
        if session[:teacher_id]
            Teacher.find(session[:teacher_id])
        elsif session[:student_id]
            Student.find(session[:student_id])
        end
    end
end
