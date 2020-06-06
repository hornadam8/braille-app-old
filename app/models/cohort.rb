class Cohort < ApplicationRecord
    belongs_to :teacher
    has_many :students, through: :cohortstudents

    validates_presence_of :name
end
