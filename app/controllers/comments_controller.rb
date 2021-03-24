class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:routine_id] && @routine = Routine.find_by_id(params[:routine_id])
            @comments = @routine.comments
        else
            @error = "That routine doesn't exist" if params[:routine_id]
            @comments = Comment.all
        end
    end

    def new
        if params[:routine_id] && @routine = Routine.find_by_id(params[:routine_id])
            @comment = @routine.comments.build
        else
            @error = "That routine doesn't exist" if params[:routine_id]
            @comment = Comment.new
        end
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
