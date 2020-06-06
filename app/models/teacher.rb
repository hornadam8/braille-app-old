class Teacher < ApplicationRecord
    has_many :cohorts
    has_many :assignments, through: :cohorts
    has_many :students, through: :cohorts

    has_secure_password
    validates_presence_of :name
    validates_uniqueness_of :email
    validates_with EmailValidator
end
