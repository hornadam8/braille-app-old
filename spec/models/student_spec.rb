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
end