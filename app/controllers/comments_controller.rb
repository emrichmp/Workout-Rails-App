class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end

    def show
        @comment = Comment.find_by(id: params[:id])
    end

    private
    def comment_params
        params.require(:comment).permit(:content,:routine_id)
      end
    
      def set_comment
        @comment = Comment.find_by(id: params[:id])
        # if !@comment
        #   flash[:message] = "Comment was not found"
        #   redirect_to comments_path
        # end
      end
    
      def redirect_if_not_comment_author
         redirect_to comments_path if @comment.user != current_user
      end
end
