require 'rails_helper'

RSpec.describe Teacher, type: :model do

    def set
        @user_1 = User.create(name: "Robin Williams", email: "rwilliams@example.com", password: "password", role: "teacher")
        @user_2 = User.create(name: "Obi Wan Kinobi", email: "obiwan@example.com", password: "password", role: "student")
        @user_3 = User.create(name: "Karate Kid", email: "karatekid@example.com", password: "password", role: "student")
        @teacher = Teacher.create(user_id: @user_1.id)
        @student_1 = Student.create(user_id: @user_2.id)
        @student_2 = Student.create(user_id: @user_3.id)
    end

    let(:cohort_attributes_1) do
        {
            name: "Pottery 101",
            teacher_id: 1
        }
    end

    let(:cohort_attributes_2) do
        {
            name: "Slacking 435",
            teacher_id: 1
        }
    end

    it "has many cohorts" do
        set
        @teacher.cohorts.create(cohort_attributes_1)
        @teacher.cohorts.create(cohort_attributes_2)
        expect(@teacher.cohorts.all.length).to eql(2)
        @teacher.cohorts = []
    end

    it "has many assignments through cohorts" do
        set
        @cohort = @teacher.cohorts.create(cohort_attributes_1)
        @cohort.assignments.create(name: "Test Assignment 1")
        @cohort.assignments.create(name: "Test Assignment 2")
        expect(@teacher.assignments.all.length).to eql(2)
        @cohort.destroy
    end


    it "has many students through cohorts" do
        set
        @cohort = @teacher.cohorts.create(cohort_attributes_1)
        @cohort.students << [@student_1,@student_2]
        @cohort.save
        expect(@teacher.cohorts.last.students.all).to be == [@student_1,@student_2]
        expect(@teacher.students.all).to be == [@student_1,@student_2]
        @cohort.destroy
    end


end