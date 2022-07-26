class TasksController < ApplicationController
  def new
    @task = Task.new
    @user = User.find(params[:user_id])
    @tags = Tag.joins(:user).where(users: { id: @user.id })
  end

  def create
    @task = Task.new
    if params[:taggable].nil?
      flash[:alert] = 'Please choose at least one tag and try again.'
      redirect_to new_task_url
    elsif params[:taggable][:tag_ids].count > 3
      flash[:alert] = 'Please select no more than three tags.'
      redirect_to new_task_url
    else
      @task.user_id = params[:user_id]
      @task.title = params[:task][:title]
      @task.level = params[:task][:level]
      @task.deadline = params[:task][:deadline]
      
      if @task.save
        params[:taggable][:tag_ids].each do |taggable|
          @taggable = Taggable.new
          @taggable.task_id = @task.id.to_i
          @taggable.tag_id = taggable.to_i
          @taggable.save
        end

        redirect_to user_tasks_url
        flash[:alert] = 'Success!'

      else
        flash[:alert] = 'Error'
        render :new
      end
    end
  end
end
