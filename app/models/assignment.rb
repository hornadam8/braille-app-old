class Assignment < ApplicationRecord
    belongs_to :cohort
    has_many :papers

    validates_presence_of :name
end
