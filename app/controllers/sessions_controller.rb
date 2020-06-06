class SessionsController < ApplicationController

    def new_student
        @student = Student.new
    end

    def create_student
        @student = Student.find_by(email: params[:student][:email])
        if @student.present? && @student.authenticate(params[:student][:password])
            session[:student_id] = @student.id
            redirect_to student_path(@student)
        else
            redirect_to '/signin/student'
        end

    end

    def new_teacher
        @teacher = Teacher.new
    end

    def create_teacher
        @teacher = Teacher.find_by(email: params[:teacher][:email])
        if @teacher.present? && @teacher.authenticate(params[:teacher][:password])
            session[:teacher_id] = @teacher.id
            redirect_to teacher_path(@teacher)
        else
            redirect_to '/signin/teacher'
        end
    end

    def logout
        session.clear
        redirect_to "/"
    end


end