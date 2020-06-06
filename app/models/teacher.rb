class Teacher < ApplicationRecord
    has_many :cohorts
    has_many :assignments, through: :cohorts
    has_many :students, through: :cohorts
end
