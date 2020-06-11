require 'rails_helper'

RSpec.describe Paper, type: :model do

    def set
        @user_1 = User.create(name: "Robin Williams", email: "rwilliams@example.com", password: "password", role: "teacher")
        @user_2 = User.create(name: "Obi Wan Kinobi", email: "obiwan@example.com", password: "password", role: "student")
        @teacher = Teacher.create(user_id: @user_1.id)
        @student = Student.create(user_id: @user_2.id)
    end

    it "can be created by a student" do
        set
        cohort = @teacher.cohorts.create(name: "Example Class")
        @assignment = cohort.assignments.create(name: "Example Assignment")
        expect(Paper.new(assignment_id: @assignment.id,student_id: @student.id)).to be_valid
        @student.destroy
        @teacher.destroy
        cohort.destroy
    end

end