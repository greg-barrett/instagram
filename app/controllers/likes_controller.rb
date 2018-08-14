class LikesController < ApplicationController
  def create
    @like= Like.create(user_id: current_user.id, post_id: params[:like][:post_id])
    @post=Post.find(params[:like][:post_id])
    respond_to do |format|
      format.html {}
      format.js
    end


  end

  def destroy
    @like=Like.find(params[:id])
    post_id= @like.post_id
    @post=Post.find(post_id)
    @like.destroy
    respond_to do |format|
      format.html {}
      format.js
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
