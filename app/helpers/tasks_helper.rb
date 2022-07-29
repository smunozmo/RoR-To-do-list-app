module TasksHelper
  def filter_by_tag_id_and_multiple_params(tag_id)
    @tasks = @tasks.joins(:taggables).where(taggables: { tag_id: }).joins(:user).where(users: { id: current_user.id })
  end

  def filter_by_params
    @tasks = @tasks.where('title LIKE ?', "%#{params[:title]}%") unless params[:title].blank?
    @tasks = @tasks.where(status: params[:status]) unless params[:status].blank?
    @tasks = @tasks.where(level: params[:level]) unless params[:level].blank?
    @tasks = @tasks.where(deadline: params[:deadline]) unless params[:deadline].blank?

    filter_by_tag_id_and_multiple_params(params[:tag_id]) unless params[:tag_id].blank?
  end
end
