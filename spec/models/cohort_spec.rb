require 'rails_helper'

RSpec.describe Cohort, type: :model do

    def set
        @user_1 = User.create(name: "Robin Williams", email: "rwilliams@example.com", password: "password", role: "teacher")
        @user_2 = User.create(name: "Obi Wan Kinobi", email: "obiwan@example.com", password: "password", role: "student")
        @user_3 = User.create(name: "Karate Kid", email: "karatekid@example.com", password: "password", role: "student")
        @teacher = Teacher.create(user_id: @user_1.id)
        @student_1 = Student.create(user_id: @user_2.id)
        @student_2 = Student.create(user_id: @user_3.id)
    end
    
    it "is valid when expected" do
        set
        expect(@teacher.cohorts.build(name: "Example class name")).to be_valid
    end

    it "is invalid without a teacher" do
        expect(Cohort.new(name: "Example class name")).to be_invalid
    end

    it "is invalid without a name" do
        set
        expect(@teacher.cohorts.build(name: "")).to be_invalid
    end

    it "has many assignments" do
        set
        @cohort = @teacher.cohorts.create(name: "Example class name")
        @cohort.assignments.create(name: "Test Assignment 1")
        @cohort.assignments.create(name: "Test Assignment 2")
        expect(@cohort.assignments.all.length).to eql(2)
        @cohort.destroy
    end

    it "destroys assignments when destroyed" do
        set
        @cohort = @teacher.cohorts.create(name: "Example class name")
        @cohort.assignments.create(name: "Test Assignment 1")
        @cohort.assignments.create(name: "Test Assignment 2")
        @cohort.destroy
        expect(@cohort.assignments.all.length).to eql(0)
    end

    it "has many students" do
        set
        @cohort = @teacher.cohorts.create(name: "Example class name")
        @cohort.students << [@student_1,@student_2]
        @cohort.save
        expect(@cohort.students.all).to be == [@student_1,@student_2]
        @cohort.destroy
    end
    


        
end