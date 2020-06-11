class Admin < ApplicationRecord
    belongs_to :school
    has_many :teachers
end
