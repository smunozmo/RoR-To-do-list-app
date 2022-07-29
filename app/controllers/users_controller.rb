class UsersController < ApplicationController
  before_action :authenticate_user!
  include UsersHelper

  def tasks
    unauthorized?

    @user = User.find(params[:user_id] || current_user.id)
    @deadline_limit_date = Time.now + 7.days
    @tasks = Task.joins(:user).where(users: { id: params[:user_id] }).where(status: 'to_do').where('deadline > ?', @deadline_limit_date).order(
      deadline: :asc, level: :desc
    )
    @tags = Tag.joins(:user).where(users: { id: params[:user_id] })
    @taggables = Taggable.all

    filter_by_tag_id unless params[:filter_by_tag_id].nil?
  end

  def all_tasks
    unauthorized?

    @user = User.find(params[:user_id])
    @tasks = Task.joins(:user).where(users: { id: params[:user_id] }).order(deadline: :asc, level: :desc)
    @tags = Tag.joins(:user).where(users: { id: params[:user_id] })
    @taggables = Taggable.all
    unless params[:filter_by_tag_id].nil?
      @tasks = Task.joins(:taggables).where(taggables: { tag_id: params[:filter_by_tag_id] })
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
