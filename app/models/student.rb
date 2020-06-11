class Student < ApplicationRecord
    
    belongs_to :user
    has_many :papers
    has_many :cohortstudents,  class_name: "CohortStudent"
    has_many :cohorts, through: :cohortstudents
    has_many :assignments, through: :cohorts
    has_many :teachers, through: :cohorts 

    def name
        self.user.name
    end
    
end
