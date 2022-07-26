module UsersHelper
    def unauthorized?
        if params[:user_id] != current_user.id.to_s
            flash[:alert] = "Oops! You are not authorized to view that page."
            redirect_to user_tasks_path(user_id: current_user.id)
        end
    end
end
