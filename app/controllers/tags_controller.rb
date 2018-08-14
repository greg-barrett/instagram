class TagsController < ApplicationController
  def index
    @tag=Tag.find_by(tag_params)
    if @tag
      @posts=@tag.posts
    else

    end
    @hashtag=params[:tag][:hashtag]
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
end
