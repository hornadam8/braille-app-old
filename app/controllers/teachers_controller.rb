class TeachersController < ApplicationController
    before_action :set_teacher, only: [:show]


    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.new(teacher_params)
        if @teacher.valid?
            @teacher.save
            session[:teacher_id] = @teacher.id
            redirect_to teacher_path(@teacher)
        else
            render :new
        end
    end

    def show
    end

    private

    def set_teacher
        @teacher = Teacher.find(params[:id])
    end

    def teacher_params
        params.require(:teacher).permit(:name,:email,:password)
    end
    
end
