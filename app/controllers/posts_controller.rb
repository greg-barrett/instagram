class PostsController < ApplicationController
  def new
    @post=Post.new
    @post.tags.build
  end
  def show
    @post=Post.find(params[:id])
    @tags=@post.tags
    @comments=@post.comments
  end

  def home
  end


  def create
    @post= current_user.posts.build(post_params)
    if @post.save
      processtags(@post)
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:post_image, :caption)
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
