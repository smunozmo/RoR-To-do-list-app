class TagsController < ApplicationController
    before_action :authenticate_user!


    def new
        @tag = Tag.new
        @user = User.find(params[:user_id])
    end

    def create
        
        @duplicate = Tag.find_by(name: params[:tag][:name], user_id: params[:user_id])

        unless @duplicate.nil?
            flash[:alert] = 'Tag already exists. Please try another name.'
            redirect_to new_tag_url
        else

            @tag = Tag.new
            @tag.name = params[:tag][:name]
            @tag.user_id = params[:user_id]
            if @tag.save
                redirect_to new_task_url
                flash[:alert] = 'Tag successfully created!'
            else
                flash[:alert] = 'Oops! Something went wrong.'
                render :new
            end
        end
    end

    private
    
    def tag_params
      params.require(:tag).permit(:name, :user_id, :task_id)
    end

end
