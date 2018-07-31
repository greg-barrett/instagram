class LikesController < ApplicationController
  def create
    @like= Like.create(user_id: current_user.id, post_id: params[:like][:post_id])
    redirect_to post_path(@like.post)


  end

  def destroy
    @like=Like.find(params[:id])
    post_id= @like.post_id
    @like.destroy
    redirect_to post_path(post_id)
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
