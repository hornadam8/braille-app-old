require 'rails_helper'

RSpec.describe Paper, type: :model do

    let(:student_attributes) do
        {
            name: "Obi Wan Kinobi",
            email: "obiwan@example.com",
            password: "password"
        }
    end

    let(:teacher_attributes) do
        {
            name: "Robin Williams",
            email: "rwilliams@example.com",
            password: "password"
        }
    end

    it "can be created by a student" do
        @student = Student.create(student_attributes)
        @teacher = Teacher.create(teacher_attributes)
        cohort = @teacher.cohorts.create(name: "Example Class")
        @assignment = cohort.assignments.create(name: "Example Assignment")
        expect(Paper.new(assignment_id: @assignment.id,student_id: @student.id)).to be_valid
        @student.destroy
        @teacher.destroy
        cohort.destroy
    end

end