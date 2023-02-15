class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash.now[:notice] = '投稿を作成しました'
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image)
  end
end
