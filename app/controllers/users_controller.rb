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

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def followers
    @user= User.find(params[:id])
    @users=@user.followers
  end

  def following
    @user= User.find(params[:id])
    @users=@user.following
  end
  private

  def user_params
    params.require(:user).permit(:avatar)
  end

end
