class FeedsController < ApplicationController
  def show
     @following_ids=[]
     current_user.following.each do |f|
      @following_ids<< f.id
     end
     @following_ids<<current_user.id
     @following_ids=@following_ids.join(", ")
     @posts=Post.where("user_id IN (#{@following_ids})")
 end

 def explore
   @posts=Post.all
 end
end
