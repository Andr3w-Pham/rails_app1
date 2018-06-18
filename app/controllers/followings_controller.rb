class FollowingsController < ApplicationController
  def create
    @following = current_user.followings.new(:follower_id => params[:follower_id])
    @following.user_id = current_user.id
    flash[:notice] = "Followed"
    @following.save
    redirect_to root_path
  end
  def destroy
    @following = Following.find(params[:id])
    @following.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Unfollowed' }
      format.json { head :no_content }
    end
  end
end
