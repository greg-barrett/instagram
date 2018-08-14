class CommentsController < ApplicationController
  def create
    @comment= current_user.comments.build(comment_params)
    @comment.save
    @post=Post.find(params[:comment][:post_id])
    @comments=@post.comments

    respond_to do |format|
      format.html { }
      format.js
    end
  end

  def destroy
    @comment= Comment.find(params[:id])
    @post=@comment.post

    @comments=@post.comments
    respond_to do |format|
      format.html { }
      format.js
    end
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :text)
  end
end
