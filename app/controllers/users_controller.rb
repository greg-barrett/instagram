class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user= User.find(params[:id])
  end

  def followers
    @user= User.find(params[:id])
    @users=@user.followers
  end

  def following
    @user= User.find(params[:id])
    @users=@user.following
  end
end
