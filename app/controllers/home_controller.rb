class HomeController < ApplicationController
  def page
    @post = Post.all
  end
end
