class FollowingsController < ApplicationController
  def create
    @relationship=current_user.active_followings.build(following_params)
    if @relationship.save
      redirect_to current_user
    else
      redirect_to current_user
    end
  end

  def destroy
    relationship=current_user.active_followings.find(params[:id])
    relationship.destroy
    redirect_to current_user
  end

  private
  def following_params
    params.require(:following).permit(:followed_id)
  end
end
