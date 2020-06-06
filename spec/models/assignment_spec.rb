require 'rails_helper'

RSpec.describe Assignment, type: :model do

    let(:teacher_attributes) do
        {
            name: "Robin Williams",
            email: "rwilliams@example.com",
            password: "password"
        }
    end

    let(:cohort_attributes) do
        {
            name: "Pottery 101",
            teacher_id: 1
        }
    end



    
    it "is valid when expected" do
        @teacher = Teacher.create(teacher_attributes)
        @cohort = @teacher.cohorts.create(cohort_attributes)
        expect(@cohort.assignments.build(name: "Intro Assignment")).to be_valid
        @teacher.destroy
    end

    it "is invalid without a cohort" do
        expect(Assignment.new(name: "Intro Assignment")).to be_invalid
    end

    it "is invalid without a name" do
        @teacher = Teacher.create(teacher_attributes)
        @cohort = @teacher.cohorts.build(cohort_attributes)
        expect(@cohort.assignments.build(name: "")).to be_invalid
        @teacher.destroy
    end
        
end