require 'rails_helper'

RSpec.describe Student, type: :model do
    def set
        @user_1 = User.create(name: "Obi Wan Kinobi", email: "obiwan@example.com", password: "password", role: "student")
        @user_2 = User.create(name: "Robin Williams", email: "rwilliams@example.com", password: "password", role: "teacher")
        @user_3 = User.create(name: "Master Yoda", email: "yoda@example.com", password: "password", role: "teacher")
        @teacher_1 = Teacher.create(user_id: @user_2.id)
        @teacher_2 = Teacher.create(user_id: @user_3.id)
        @student = Student.create(user_id: @user_1.id)
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

    it "has many papers" do
        set
        @cohort = @teacher_1.cohorts.create(name: "Example Class")
        @assignment = @cohort.assignments.create(name: "Example Assignment")
        @paper_1 = @student.papers.create(paper_attributes_1)
        @paper_2 = @student.papers.create(paper_attributes_2)
        expect(@student.papers.all).to be == [@paper_1,@paper_2]
        @cohort.destroy
        @paper_1.destroy
        @paper_2.destroy
    end

    it "has many cohorts" do
        set
        @cohort = @teacher_1.cohorts.create(name: "Example class name")
        @cohort.students << @student
        @cohort.save
        expect(@student.cohorts.all).to be == [@cohort]
        @cohort.destroy
    end

    it "has many assignments through cohorts" do
        set
        @cohort = @teacher_1.cohorts.create(name: "Example Class")
        @cohort.students << @student
        @assignment_1 = @cohort.assignments.create(name: "Example Assignment")
        @assignment_2 = @cohort.assignments.create(name: "Another Example Assignment")
        expect(@student.assignments.all).to be == [@assignment_2,@assignment_1]
        @cohort.destroy
    end

    it "has many teachers through cohorts" do
        set
        @cohort_1 = @teacher_1.cohorts.create(name: "Example Class")
        @cohort_2 = @teacher_2.cohorts.create(name: "Another Example Class")
        @cohort_1.students << @student
        @cohort_2.students << @student
        expect(@student.teachers.all).to be == [@teacher_1,@teacher_2]
        @cohort_1.destroy
        @cohort_2.destroy
    end


end