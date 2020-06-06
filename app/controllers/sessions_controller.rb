class SessionsController < ApplicationController

    def new_student
        @student = Student.new
    end

    def create_student

    end

    def new_teacher
        @teacher = Teacher.new
    end

    def create_teacher
    end

end