class TagsController < ApplicationController
    def new
        @tag = Tag.new
        @user = User.find(params[:user_id])
    end

    def create
        @tag = Tag.new
        @tag.user_id = params[:user_id]
        @tag.name = params[:tag][:name]
        if @tag.save
            redirect_to new_task_url
            flash[:alert] = 'Success!'
        else
            flash[:alert] = 'Error'
            render :new
        end
    end
end
