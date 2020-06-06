class Student < ApplicationRecord
    has_many :papers
    has_many :cohorts, through: :cohortstudents
    has_many :assignments, through: :cohorts
    has_many :teachers, through: :cohorts
    
    has_secure_password
    validates_presence_of :name
    validates_uniqueness_of :email
    validates_with EmailValidator

    
end
