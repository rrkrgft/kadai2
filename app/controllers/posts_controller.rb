class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        flash.now[:notice] = '投稿を作成しました'
        redirect_to posts_path
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if user_check
      if @post.update(post_params)
        redirect_to posts_path, notice: "投稿を編集しました"
      else
        render :edit
      end
    else
      redirect_to posts_path, notice: "投稿編集の権限がありません"
    end
  end

  def destroy
    if user_check
      @post.destroy
      redirect_to posts_path, notice: "投稿を削除しました"
    else
      redirect_to posts_path, notice: "投稿を削除の権限がありません"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def user_check
    @post.user.id == current_user.id
  end
end
