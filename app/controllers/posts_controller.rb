class PostsController < ApplicationController
  
  def index
    @post = Post.find(1)
    test
    test
  end
end
