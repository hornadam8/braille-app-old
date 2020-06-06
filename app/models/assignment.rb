class Assignment < ApplicationRecord
    belongs_to :cohort
    has_many :papers
end
