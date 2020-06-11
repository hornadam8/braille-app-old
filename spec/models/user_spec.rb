require 'rails_helper'

RSpec.describe User, type: :model do
    
    let(:valid_attributes) do
        {
            name: "Robin Williams",
            email: "rwilliams@example.com",
            password: "password",
            role: "teacher"
        }
    end

    let(:valid_attributes_2) do
        {
            name: "Obi Wan Kinobi",
            email: "obiwan@example.com",
            password: "password",
            role: "student"
        }
    end

    let(:missing_name) { valid_attributes.except(:name) }
    let(:missing_email) { valid_attributes.except(:email) }
    let(:missing_password) { valid_attributes.except(:password) }
    let(:missing_role) { valid_attributes.except(:role) }
    let(:invalid_role) { valid_attributes.merge(role: "notrole") }
    let(:invalid_email_1) { valid_attributes.merge(email: "notanemail.com") }
    let(:invalid_email_2) { valid_attributes.merge(email: "not@anemail") }

    it "is valid when expected" do
        expect(User.new(valid_attributes)).to be_valid
    end

    it "finds or creates a teacher when role is teacher" do
        t = User.create(valid_attributes)
        expect(Teacher.all.last.user_id).to be == t.id
    end

    it "finds or creates a student when role is teacher" do
        t = User.create(valid_attributes_2)
        expect(Student.all.last.user_id).to be == t.id
    end

    it "is invalid without a name" do
        expect(User.new(missing_name)).to be_invalid
    end

    it "is invalid without a email" do
        expect(User.new(missing_email)).to be_invalid
    end

    it "is invalid without a password" do
        expect(User.new(missing_password)).to be_invalid
    end

    it "is invalid with an invalid email" do
        expect(User.new(invalid_email_1)).to be_invalid
        expect(User.new(invalid_email_2)).to be_invalid
    end

    it "is invalid without a role" do
        expect(User.new(missing_role)).to be_invalid
    end

    it "is invalid with an invalid role" do
        expect(User.new(invalid_role)).to be_invalid
    end


   
    

    
end