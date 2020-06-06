class Cohort < ApplicationRecord
    belongs_to :teacher
    has_many :students, through: :cohortstudents

end
