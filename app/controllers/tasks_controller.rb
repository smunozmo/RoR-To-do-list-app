class TasksController < ApplicationController
  before_action :authenticate_user!
  include TasksHelper
  include UsersHelper
  def new
    @task = Task.new
    @user = User.find(params[:user_id])
    @tags = Tag.joins(:user).where(users: { id: @user.id })
  end

  def create
    if params[:taggable].blank?
      flash[:alert] = 'Please choose o create at least one tag and try again.'
      redirect_to new_task_url
    elsif params[:taggable][:tag_ids].count > 3
      flash[:alert] = 'Please select no more than three tags.'
      redirect_to new_task_url
    else

      @task = Task.new
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
        flash[:alert] = 'Task successfully created!'

      else
        flash[:alert] = 'Oops! Something went wrong.'
        render :new
      end
    end
  end

  def change_status
    @task = Task.find(params[:id])
    @task.update(status: params[:status])

    redirect_to user_tasks_path(user_id: current_user.id)
    flash[:alert] = "Status updated to #{@task.status}"
  end

  def filter
    unauthorized?
    @user = User.find(params[:user_id])
    @tasks = Task.joins(:user).where(users: { id: params[:user_id] }).order(deadline: :asc, level: :desc)
    @tags = Tag.joins(:user).where(users: { id: params[:user_id] })
    @taggables = Taggable.all

    # see TasksHelper
    filter_by_params
  end

  def new_filter
    @user = User.find(params[:user_id])
    @tasks = Task.joins(:user).where(users: { id: params[:user_id] }).order(deadline: :asc, level: :desc)
    @tags = Tag.joins(:user).where(users: { id: params[:user_id] })
    @taggables = Taggable.all
  end

  private

  def task_params
    params.require(:task).permit(:title, :status, :level, :deadline, :user_id)
  end
end
