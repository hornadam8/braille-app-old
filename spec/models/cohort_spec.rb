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
        
end