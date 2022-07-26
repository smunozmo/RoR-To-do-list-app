class UserController < ApplicationController
  def tasks
    @user = User.find(current_user.id)
    @tasks = Task.joins(:user).where(users: { id: current_user.id })
  end
end
