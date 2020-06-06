require 'rails_helper'

RSpec.describe Teacher, type: :model do
    
    let(:valid_attributes) do
        {
            name: "Robin Williams",
            email: "rwilliams@example.com",
            password: "password"
        }
    end

    let(:missing_name) { valid_attributes.except(:name) }
    let(:missing_email) { valid_attributes.except(:email) }
    let(:missing_password) { valid_attributes.except(:password) }
    let(:invalid_email_1) { valid_attributes.merge(email: "notanemail.com") }
    let(:invalid_email_2) { valid_attributes.merge(email: "not@anemail") }

    it "is valid when expected" do
        expect(Teacher.new(valid_attributes)).to be_valid
    end

    it "is invalid without a name" do
        expect(Teacher.new(missing_name)).to be_invalid
    end

    it "is invalid without a email" do
        expect(Teacher.new(missing_email)).to be_invalid
    end

    it "is invalid without a password" do
        expect(Teacher.new(missing_password)).to be_invalid
    end

    it "is invalid with an invalid email" do
        expect(Teacher.new(invalid_email_1)).to be_invalid
        expect(Teacher.new(invalid_email_2)).to be_invalid
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
        @teacher = Teacher.create(valid_attributes)
        @teacher.cohorts.create(cohort_attributes_1)
        @teacher.cohorts.create(cohort_attributes_2)
        expect(@teacher.cohorts.all.length).to eql(2)
        @teacher.destroy
    end

    it "has many assignments through cohorts" do
        @teacher = Teacher.create(valid_attributes)
        @cohort = @teacher.cohorts.create(cohort_attributes_1)
        @cohort.assignments.create(name: "Test Assignment 1")
        @cohort.assignments.create(name: "Test Assignment 2")
        expect(@teacher.assignments.all.length).to eql(2)
        @cohort.destroy
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

    it "has many students through cohorts" do
        @teacher = Teacher.create(valid_attributes)
        @cohort = @teacher.cohorts.create(cohort_attributes_1)
        @student_1 = Student.create(student_attributes_1)
        @student_2 = Student.create(student_attributes_2)
        @cohort.students << [@student_1,@student_2]
        @cohort.save
        expect(@teacher.cohorts.last.students.all).to be == [@student_1,@student_2]
        expect(@teacher.students.all).to be == [@student_1,@student_2]
        @cohort.destroy
        @teacher.destroy
    end

    

    
end