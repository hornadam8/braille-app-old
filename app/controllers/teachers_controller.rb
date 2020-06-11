class TeachersController < ApplicationController
    before_action :set_teacher, only: [:show,:edit,:update,:destroy]
    before_action :teacher_filter, only: [:show,:edit,:update,:destroy]

    def show

    end
    
    def edit

    end

    def update

    end

    def destroy
        
    end
    
end