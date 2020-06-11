require 'rails_helper'

RSpec.describe Assignment, type: :model do

    def set
        @user_1 = User.create(name: "Robin Williams", email: "rwilliams@example.com", password: "password", role: "teacher")
        @user_2 = User.create(name: "Obi Wan Kinobi", email: "obiwan@example.com", password: "password", role: "student")
        @teacher = Teacher.create(user_id: @user_1.id)
        @student = Student.create(user_id: @user_2.id)
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

    
    it "is valid when expected" do
        set
        @cohort = @teacher.cohorts.create(name: "Example Class")
        expect(@cohort.assignments.build(name: "Intro Assignment")).to be_valid
    end

    it "is invalid without a cohort" do
        expect(Assignment.new(name: "Intro Assignment")).to be_invalid
    end

    it "is invalid without a name" do
        set
        @cohort = @teacher.cohorts.create(name: "Example Class")
        expect(@cohort.assignments.build(name: "")).to be_invalid
        @cohort.destroy
    end

    it "has many papers" do
        set
        @cohort = @teacher.cohorts.create(name: "Example Class")
        @assignment = @cohort.assignments.create(name: "Example Assignment")
        @paper_1 = @student.papers.create(paper_attributes_1)
        @paper_2 = @student.papers.create(paper_attributes_2)
        expect(@assignment.papers.all).to be == [@paper_1,@paper_2]
        @cohort.destroy
        @paper_1.destroy
        @paper_2.destroy
    end
        
end