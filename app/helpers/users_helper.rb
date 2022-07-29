module UsersHelper
  def unauthorized?
    if params[:user_id] != current_user.id.to_s
      flash[:alert] = 'Oops! You are not authorized to view that page.'
      redirect_to user_tasks_path(user_id: current_user.id)
    end
  end

  def filter_by_tag_id
    @tasks = Task.joins(:taggables).where(taggables: { tag_id: params[:filter_by_tag_id] }).joins(:user).where(users: { id: current_user.id }).where(status: 'to_do').where('deadline > ?', @deadline_limit_date).order(
      deadline: :asc, level: :desc
    )
  end
end
