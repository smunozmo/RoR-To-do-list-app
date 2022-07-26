class UsersController < ApplicationController
  before_action :authenticate_user!
  include UsersHelper

  def tasks

    unauthorized?
  
    @user = User.find(params[:user_id])
    @deadline_limit_date = Time.now + 7.days
    @tasks = Task.joins(:user).where(users: { id: params[:user_id] }).where(status: 'to_do').where('deadline > ?', @deadline_limit_date).order(deadline: :asc, level: :desc)
    @tags = Tag.joins(:user).where(users: { id: params[:user_id] })
    @taggables = Taggable.all
    unless params[:filter_by_tag_id].nil?
      @tasks = Task.joins(:taggables).where(taggables: { tag_id: params[:filter_by_tag_id] }).joins(:user).where(users: { id: 1 }).where(status: 'to_do').where('deadline > ?', @deadline_limit_date).order(deadline: :asc, level: :desc)
    end
 
  end
  
  def all_tasks
    @user = User.find(params[:user_id])
    @tasks = Task.joins(:user).where(users: { id: params[:user_id] })
    @tags = Tag.joins(:user).where(users: { id: params[:user_id] })
    @taggables = Taggable.all
    unless params[:filter_by_tag_id].nil?
      @tasks = Task.joins(:taggables).where(taggables: { tag_id: params[:filter_by_tag_id] })
    end
  end
end
