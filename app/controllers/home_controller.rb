class HomeController < ApplicationController
  def page
    # fetch the database info from the blog
    @blogs = Blog.all
    @users = User.all
    @comment = Comment.new
  end
end
