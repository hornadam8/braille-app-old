class User < ApplicationRecord
    has_one :student
    has_one :teacher
    has_one :admin

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
        elsif user.role == "admin"
            a = Admin.find_or_create_by(user_id: user.id)
            user.update_attribute(:admin_id, a.id)
        end
    end

    def role_id
        
        if role == "teacher"
            teacher_id
        elsif role == "student"
            student_id
        elsif role == "admin"
            admin_id
        end

    end

    def school

        if role == "teacher"
            teacher = Teacher.find_or_create_by(user_id: id)
            teacher.school
        elsif role == "admin"
            admin = Admin.find_or_create_by(user_id: id)
            admin.school
        end
        
    end

    def school=(x)

        if role == "teacher"
            teacher = Teacher.find_or_create_by(user_id: id)
            teacher.school = x
        elsif role == "admin"
            admin = Admin.find_or_create_by(user_id: id)
            admin.school = x
        end

    end

    def school_id
        if role == "teacher"
            teacher = Teacher.find_or_create_by(user_id: id)
            teacher.school_id
        elsif role == "admin"
            admin = Admin.find_or_create_by(user_id: id)
            admin.school_id
        end
    end

    def school_id=(x)
        if role == "teacher"
            teacher = Teacher.find_or_create_by(user_id: id)
            teacher.school_id = x
        elsif role == "admin"
            admin = Admin.find_or_create_by(user_id: id)
            admin.school_id = x
        end
    end

end
