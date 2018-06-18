class HomeController < ApplicationController
  def page
    if !current_user.profile
      @profile = Profile.new
    else
      @blogs = Blog.all
      @comment = Comment.new
      @users = User.all
    end
  end
end
