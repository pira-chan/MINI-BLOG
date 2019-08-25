class PostsController < ApplicationController
  
before_action :move_to_index, except: [:please_login, :index, :show]  
  
  def index
      @posts = Post.includes(:user).order("id DESC").page(params[:page]).per(8)
  end
  
  def new
    @post = Post.new
  end

  def create 
    Post.create(text: post_params[:text], title: post_params[:title], user_id: current_user.id)
    redirect_to action: :index
  end
  
  def please_login
  end
  
def destroy
  post = Post.find(params[:id])
  if post.user_id == current_user.id
    post.destroy
  end
  redirect_to action: :index
end

def edit
  @post = Post.find(params[:id])
end



private

def move_to_index
  redirect_to action: :please_login unless user_signed_in?
end


def post_params
  params.permit(:title , :text)
end
end
