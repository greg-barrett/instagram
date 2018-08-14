class FollowingsController < ApplicationController
  def create

    @relationship=current_user.active_followings.build(following_params)
    @user=@relationship.followed
    @relationship.save
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy

    @relationship=current_user.active_followings.find(params[:id])
    @user= @relationship.followed
    @relationship.destroy
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private
  def following_params
    params.require(:following).permit(:followed_id)
  end
end
