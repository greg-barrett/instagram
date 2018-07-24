class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user= User.find(params[:id])
    @followers=@user.followers.length
    @following=@user.following.length
    @posts=@user.posts
    @post=@user.posts.build
    @post.tags.build
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
