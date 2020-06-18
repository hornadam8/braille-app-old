module UsersHelper

    def link_based_on_role

        if @user.role == "teacher"
            link_to "Add a Class", new_cohort_path
        elsif @user.role == "admin"
            link_to "View/edit #{@user.school} approved teachers", school_path(@user.school)
        end

    end

end
