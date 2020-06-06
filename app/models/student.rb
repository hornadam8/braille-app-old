class Student < ApplicationRecord
    has_many :papers
    has_many :cohorts, through: :cohortstudents
    has_many :assignments, through: :cohorts
    has_many :teachers, through: :cohorts
end
