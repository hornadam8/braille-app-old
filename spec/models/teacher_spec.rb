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
    
end