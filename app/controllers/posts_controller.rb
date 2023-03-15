class PostsController < ApplicationController
  def new
    @posts = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.valid?
      @post.save
    else
      render :new, status: :unprossable_entity
    end
  end

  
  private
    def post_params
      params.require(:post).permit(:body)
    end
end
