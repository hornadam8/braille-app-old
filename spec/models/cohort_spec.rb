require 'rails_helper'

RSpec.describe Cohort, type: :model do

    let(:teacher_attributes) do
        {
            name: "Robin Williams",
            email: "rwilliams@example.com",
            password: "password"
        }
    end

    
    it "is valid when expected" do
        @teacher = Teacher.create(teacher_attributes)
        expect(@teacher.cohorts.build(name: "Example class name")).to be_valid
        @teacher.destroy
    end

    it "is invalid without a teacher" do
        expect(Cohort.new(name: "Example class name")).to be_invalid
    end

    it "is invalid without a name" do
        @teacher = Teacher.create(teacher_attributes)
        expect(@teacher.cohorts.build(name: "")).to be_invalid
        @teacher.destroy
    end

    it "has many assignments" do
        @teacher = Teacher.create(teacher_attributes)
        @cohort = @teacher.cohorts.create(name: "Example class name")
        @cohort.assignments.create(name: "Test Assignment 1")
        @cohort.assignments.create(name: "Test Assignment 2")
        expect(@cohort.assignments.all.length).to eql(2)
        @cohort.destroy
        @teacher.destroy
    end

    it "destroys assignments when destroyed" do
        @teacher = Teacher.create(teacher_attributes)
        @cohort = @teacher.cohorts.create(name: "Example class name")
        @cohort.assignments.create(name: "Test Assignment 1")
        @cohort.assignments.create(name: "Test Assignment 2")
        @cohort.destroy
        expect(@cohort.assignments.all.length).to eql(0)
        @teacher.destroy
    end

    let(:student_attributes_1) do
        {
            name: "Obi Wan Kinobi",
            email: "obiwan@example.com",
            password: "password"
        }
    end

    let(:student_attributes_2) do
        {
            name: "Karate Kid",
            email: "karatekid@example.com",
            password: "password"
        }
    end

    it "has many students" do
        @teacher = Teacher.create(teacher_attributes)
        @cohort = @teacher.cohorts.create(name: "Example class name")
        @student_1 = Student.create(student_attributes_1)
        @student_2 = Student.create(student_attributes_2)
        @cohort.students << [@student_1,@student_2]
        @cohort.save
        expect(@cohort.students.all).to be == [@student_1,@student_2]
        @cohort.destroy
        @teacher.destroy
        @student_1.destroy
        @student_2.destroy
    end
    


        
end