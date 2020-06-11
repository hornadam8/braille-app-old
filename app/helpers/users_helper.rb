module UsersHelper

    def link_to_add_cohort
        if @user.role == "teacher"
            link_to "Add a Class", new_cohort_path
        end
    end
end
