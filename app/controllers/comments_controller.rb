class CommentsController < ApplicationController


def index
  @comments = Comment.all
end

  def create
  @comment = Comment.new(comment_params)
  @comment.user = current_user
  if @comment.save
    redirect_back(fallback_location: root_path)
  else
    redirect_back(fallback_location: root_path)
  end

end

def destroy
  @comment = Comment.find_by(id: params[:id])
  @comment.destroy
   redirect_to  request.referrer || root_url
end

private

def comment_params
  params.require(:comment).permit(:body, :user_id ,:post_id)
end

end
