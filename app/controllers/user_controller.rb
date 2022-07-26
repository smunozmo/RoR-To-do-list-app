class UserController < ApplicationController
  def tasks
    @user = User.find(params[:user_id])
    @tasks = Task.joins(:user).where(users: { id: params[:user_id] })
  end
end
