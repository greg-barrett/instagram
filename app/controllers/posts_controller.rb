class PostsController < ApplicationController
  def new
  end
  def show
    @post=Post.find(params[:id])
    @tags=@post.tags
  end

  def home
  end


  def create
    @post= Post.new(post_params)
    if @post.save
      processtags(@post)
      redirect_to user_path(post_params[:user_id])
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_image, :caption, :user_id)
  end

  def tags
    tags= params[:post][:tags_attributes]["0"][:hashtag]
    tags=tags.split(" ")
    return tags
  end

  def processtags(post)
    tags().each do |t|
      newtag=""
      tagging=""
      tagged=""
      result= Tag.exists?(:hashtag => t)
      if !result
        newtag= Tag.create(hashtag: t)
        tagging=Tagging.create(tag_id: newtag.id, post_id: post.id)
      else
        result=Tag.find_by(hashtag: t)
        if !Tagging.exists?(:tag_id => result.id, :post_id => post.id)
          Tagging.create(tag_id: result.id, post_id: post.id)
        end
      end
    end
  end

  def gettagnames(tag_params)
    @tagname=tag_params
  end
end
