require 'rails_helper'

RSpec.describe Student, type: :model do
    let(:valid_attributes) do
        {
            name: "Obi Wan Kinobi",
            email: "obiwan@example.com",
            password: "password"
        }
    end

    let(:missing_name) { valid_attributes.except(:name) }
    let(:missing_email) { valid_attributes.except(:email) }
    let(:missing_password) { valid_attributes.except(:password) }
    let(:invalid_email_1) { valid_attributes.merge(email: "notanemail.com") }
    let(:invalid_email_2) { valid_attributes.merge(email: "not@anemail") }

    it "is valid when expected" do
        expect(Student.new(valid_attributes)).to be_valid
    end

    it "is invalid without a name" do
        expect(Student.new(missing_name)).to be_invalid
    end

    it "is invalid without a email" do
        expect(Student.new(missing_email)).to be_invalid
    end

    it "is invalid without a password" do
        expect(Student.new(missing_password)).to be_invalid
    end

    it "is invalid with an invalid email" do
        expect(Student.new(invalid_email_1)).to be_invalid
        expect(Student.new(invalid_email_2)).to be_invalid
    end

    let(:teacher_attributes_1) do
        {
            name: "Robin Williams",
            email: "rwilliams@example.com",
            password: "password"
        }
    end

    let(:teacher_attributes_2) do
        {
            name: "Master Yoda",
            email: "yoda@example.com",
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

    it "has many papers" do
        @teacher = Teacher.create(teacher_attributes_1)
        @cohort = @teacher.cohorts.create(name: "Example Class")
        @assignment = @cohort.assignments.create(name: "Example Assignment")
        @student = Student.create(valid_attributes)
        @paper_1 = @student.papers.create(paper_attributes_1)
        @paper_2 = @student.papers.create(paper_attributes_2)
        expect(@student.papers.all).to be == [@paper_1,@paper_2]
        @student.destroy
        @teacher.destroy
        @cohort.destroy
        @paper_1.destroy
        @paper_2.destroy
    end

    it "has many cohorts" do
        @teacher = Teacher.create(teacher_attributes_1)
        @cohort = @teacher.cohorts.create(name: "Example class name")
        @student = Student.create(valid_attributes)
        @cohort.students << @student
        @cohort.save
        expect(@student.cohorts.all).to be == [@cohort]
        @cohort.destroy
        @teacher.destroy
        @student.destroy
    end

    it "has many assignments through cohorts" do
        @teacher = Teacher.create(teacher_attributes_1)
        @cohort = @teacher.cohorts.create(name: "Example Class")
        @student = Student.create(valid_attributes)
        @cohort.students << @student
        @assignment_1 = @cohort.assignments.create(name: "Example Assignment")
        @assignment_2 = @cohort.assignments.create(name: "Another Example Assignment")
        expect(@student.assignments.all).to be == [@assignment_2,@assignment_1]
        @student.destroy
        @teacher.destroy
        @cohort.destroy
    end

    it "has many teachers through cohorts" do
        @teacher_1 = Teacher.create(teacher_attributes_1)
        @teacher_2 = Teacher.create(teacher_attributes_2)
        @cohort_1 = @teacher_1.cohorts.create(name: "Example Class")
        @cohort_2 = @teacher_2.cohorts.create(name: "Another Example Class")
        @student = Student.create(valid_attributes)
        @cohort_1.students << @student
        @cohort_2.students << @student
        expect(@student.teachers.all).to be == [@teacher_1,@teacher_2]
        @student.destroy
        @teacher_1.destroy
        @teacher_2.destroy
        @cohort_1.destroy
        @cohort_2.destroy
    end


end