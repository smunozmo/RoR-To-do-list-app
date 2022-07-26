class TagsController < ApplicationController
    def new
        @tag = Tag.new
        @user = User.find(params[:user_id])
    end

    def create
        @duplicate = Tag.find_by(name: params[:tag][:name])
        if !@duplicate.nil? || @duplicate.user_id == params[:user_id].to_i
            flash[:alert] = 'Tag already exists. Please try another name.'
            redirect_to new_tag_url
        else
            @tag = Tag.new
            @tag.name = params[:tag][:name]
            @tag.user_id = params[:user_id]
            if @tag.save
                redirect_to user_tags_url
                flash[:alert] = 'Success!'
            else
                flash[:alert] = 'Error'
                render :new
            end
        end
    end
end
