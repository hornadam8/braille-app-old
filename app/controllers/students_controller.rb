class StudentsController < ApplicationController
    before_action :set_student, only: [:show,:edit,:update,:destroy]
    before_action :student_filter, only: [:show,:edit,:update,:destroy]
    
    def show

    end
    
    def edit

    end

    def update

    end

    def destroy
        
    end

end