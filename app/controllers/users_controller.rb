class UsersController < ApplicationController
  def index
    @users=User.where(first_name: params[:name])

  end

  def show
    @user= User.find(params[:id])
    @followers=@user.followers.length
    @following=@user.following.length
    @posts=@user.posts
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

  def home
    @user=current_user
    @followers=@user.followers.length
    @following=@user.following.length
    @posts=@user.posts
    @post=@user.posts.build
    @post.tags.build
    redirect_to @user
  end


  def followers
    @user= User.find(params[:id])
    @users=@user.followers
  end

  def following
    @user= User.find(params[:id])
    @users=@user.following
  end

  def liked_posts
    @posts=current_user.liked_posts
  end
  private

  def user_params
    params.require(:user).permit(:avatar)
  end

end
