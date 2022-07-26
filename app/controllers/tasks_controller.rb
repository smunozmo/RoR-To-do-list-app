class TasksController < ApplicationController
  def new
    @task = Task.new
    @user = User.find(params[:user_id])
    @tags = Tag.joins(:user).where(users: { id: @user.id })
  end

  def create
    @task = Task.new
    @task.user_id = params[:user_id]
    @task.title = params[:task][:title]
    @task.level = params[:task][:level]
    @task.deadline = params[:task][:deadline]

    if @task.save
      redirect_to user_tasks_url
      flash[:alert] = 'Success!'
    else
      flash[:alert] = 'Error'
      render :new
    end
  end
end
