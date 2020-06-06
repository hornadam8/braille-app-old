require 'rails_helper'

RSpec.describe Assignment, type: :model do

    let(:teacher_attributes_1) do
        {
            name: "Robin Williams",
            email: "rwilliams@example.com",
            password: "password"
        }
    end

    let(:paper_attributes_1) do
        {
            student_id: 1,
            assignment_id: 1,
            content: "Example paper content, it can be a really long entry."
        }
    end

    let(:paper_attributes_2) do
        {
            student_id: 1,
            assignment_id: 1,
            content: "Example paper content, it can be a really long entry. Again, suuuuuuuuuuuuuuper long"
        }
    end

    let(:student_attributes_1) do
        {
            name: "Obi Wan Kinobi",
            email: "obiwan@example.com",
            password: "password"
        }
    end




    
    it "is valid when expected" do
        @teacher = Teacher.create(teacher_attributes_1)
        @cohort = @teacher.cohorts.create(name: "Example Class")
        expect(@cohort.assignments.build(name: "Intro Assignment")).to be_valid
        @teacher.destroy
    end

    it "is invalid without a cohort" do
        expect(Assignment.new(name: "Intro Assignment")).to be_invalid
    end

    it "is invalid without a name" do
        @teacher = Teacher.create(teacher_attributes_1)
        @cohort = @teacher.cohorts.create(name: "Example Class")
        expect(@cohort.assignments.build(name: "")).to be_invalid
        @teacher.destroy
    end

    it "has many papers" do
        @teacher = Teacher.create(teacher_attributes_1)
        @cohort = @teacher.cohorts.create(name: "Example Class")
        @assignment = @cohort.assignments.create(name: "Example Assignment")
        @student = Student.create(student_attributes_1)
        @paper_1 = @student.papers.create(paper_attributes_1)
        @paper_2 = @student.papers.create(paper_attributes_2)
        expect(@assignment.papers.all).to be == [@paper_1,@paper_2]
        @student.destroy
        @teacher.destroy
        @cohort.destroy
        @paper_1.destroy
        @paper_2.destroy
    end
        
end