class Cohort < ApplicationRecord
    belongs_to :teacher
    has_many :assignments, :dependent => :destroy
    has_many :cohortstudents, class_name: "CohortStudent"
    has_many :students, through: :cohortstudents

    validates_presence_of :name,:teacher_id
end
