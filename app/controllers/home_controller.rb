class HomeController < ApplicationController
  def page
    if user_signed_in?
      redirect_to profiles_path
    end
    @posts = Post.all 
  end
end
