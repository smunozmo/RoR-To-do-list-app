class UsersController < ApplicationController
  def tasks
    @user = User.find(params[:user_id])
    @tasks = Task.joins(:user).where(users: { id: params[:user_id] })
  end

  def tags
    @user = User.find(params[:user_id])
    @tags = Tag.joins(:user).where(users: { id: params[:user_id] })
  end
end
