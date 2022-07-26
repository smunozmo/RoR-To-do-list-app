class UsersController < ApplicationController
  def tasks
    @user = User.find(params[:user_id])
    @tasks = Task.joins(:user).where(users: { id: params[:user_id] })
    @tags = Tag.joins(:user).where(users: { id: params[:user_id] })
    @taggables = Taggable.all
  end

  def filter_tag
    @user = User.find(params[:user_id])
    @tasks = Task.joins(:user).where(users: { id: params[:user_id] })
    @tags = Tag.joins(:user).where(users: { id: params[:user_id] })
    @taggables = Taggable.all
    @filter_tag = Tag.find(params[:tag_id])
  end

  def tags
    @user = User.find(params[:user_id])
    @tags = Tag.joins(:user).where(users: { id: params[:user_id] })
  end

  #delete
  def taggables
    @taggables = Taggable.all
  end
end
