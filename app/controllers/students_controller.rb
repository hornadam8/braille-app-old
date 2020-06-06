class StudentsController < ApplicationController
    before_action :set_student, only: [:show]
    
    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.valid?
            @student.save
            session[:student_id] = @student.id
            redirect_to student_path(@student)
        else
            render :new
        end
    end

    def show
    end

    private

    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:name,:email,:password)
    end
end
