class FollowingsController < ApplicationController
  def create
    @following = current_user.followings.new(:follower_id => params[:follower_id])
    @following.user_id = current_user.id
    flash[:notice] = "Followed succesfully"
    @following.save
    redirect_to follow_page_path
  end
  def destroy
    @following = current_user.followings.find(params[:id])
    @following.destroy
    flash[:notice] = "Unfollowed"
    redirect_to follow_page_path
  end

end
