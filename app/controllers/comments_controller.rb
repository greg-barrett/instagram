class CommentsController < ApplicationController
  def create
    @comment= current_user.comments.build(comment_params)
    @comment.save
    redirect_to post_path(@comment.post)
  end

  def destroy
    @comment= Comment.find(params[:id])
    post_id=@comment.post
    @comment.destroy
    redirect_to post_path(post_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :text)
  end
end
