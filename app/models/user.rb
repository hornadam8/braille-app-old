class User < ApplicationRecord
    has_one :student
    has_one :teacher

    has_secure_password
    validates_presence_of :name,:password,:email
    validates_uniqueness_of :email
    validates_with EmailValidator

    validates :role, inclusion: {in: %w(admin teacher student)}

    after_create do |user|
        if user.role == "teacher"
            t = Teacher.find_or_create_by(user_id: user.id)
            user.update_attribute(:teacher_id, t.id)
        elsif user.role == "student"
            s = Student.find_or_create_by(user_id: user.id)
            user.update_attribute(:student_id, s.id)
        end
    end

    def role_id
        if role == "teacher"
            teacher_id
        elsif role == "student"
            student_id
        end
    end

end
