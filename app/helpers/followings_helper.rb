module FollowingsHelper
  def followed_by_visitor?(followers)
     if followers.include?(current_user)
       return true
     end
  end

end
