class Teacher < ApplicationRecord

    belongs_to :user
    belongs_to :school
    has_many :cohorts
    has_many :assignments, through: :cohorts
    has_many :students, through: :cohorts
    has_many :teacheraccesscodes
    has_many :schools, through: :teacheraccesscodes
    def name
        self.user.name
    end

end
