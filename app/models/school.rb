class School < ApplicationRecord
    has_one :admin
    has_many :teachers
    #has_many :teacheraccesscodes
    #has_many :teachers, through: :teacheraccesscodes

    def teacher_emails
        []
    end

    def teacher_email=(email)
        teacher_emails << email
    end
end
