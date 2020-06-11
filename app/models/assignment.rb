class Assignment < ApplicationRecord
    belongs_to :cohort
    has_one :teacher, through: :cohort
    has_many :students, through: :cohort
    has_many :papers, through: :students

    validates_presence_of :name,:cohort_id
end
