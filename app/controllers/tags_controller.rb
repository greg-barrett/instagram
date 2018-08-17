class TagsController < ApplicationController
  def index
    @hashtag=params[:tag][:hashtag]
    if params[:tag][:hashtag][0]!="#"
      user_search(params[:tag][:hashtag])
    else
      @tag=Tag.find_by(tag_params)
        if @tag
          @posts=@tag.posts
        else
          flash.now[:warning]="No results for #{@hashtag}" if !@tag
        end
    end
  end

  def show
      @tag=Tag.find(params[:id])
      @posts=@tag.posts
      @hashtag=@tag.hashtag
      render "tags/index"
  end


  private
  def tag_params
    params.require(:tag).permit(:hashtag)
  end

  def user_search(name)
    @name=name.capitalize
    count=User.where(first_name: @name).count
    if count === 0
     flash.now[:warning]="We couldn't find a user called #{@name}"
    elsif count === 1
      redirect_to user_path(User.find_by(first_name: @name))
    else
      @users=User.where(first_name: @name)
      redirect_to users_path(:name =>@name)
    end
  end
end
