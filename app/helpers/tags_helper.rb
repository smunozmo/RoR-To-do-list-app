module TagsHelper
    def duplicated_tag?
        
        @duplicate = Tag.find_by(name: params[:tag][:name], user_id: params[:user_id])

        unless @duplicate.nil?
            flash[:alert] = 'Tag already exists. Please try another name.'
            redirect_to new_tag_url
        end
    end
end
