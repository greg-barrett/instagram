module LikesHelper
  def liked?(post)
    Like.exists?(post_id: post.id, user_id: current_user.id)
  end
end
