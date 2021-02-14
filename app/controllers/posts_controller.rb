class PostsController < ApplicationController
  before_action :select_post, only: [:edit, :update, :destroy]
  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path,
      notice: "あなたのぼやきを投稿しました！"
    else
      render :index
    end
  end
  def edit
  end
  def update
    if @post.update(post_params)
      redirect_to posts_path,
      notice: "あなたのぼやきを編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @post.destroy
    redirect_to posts_path,
    notice: "あなたのぼやきをサメに食べさせました！"
  end
  private
  def post_params
    params.require(:post).permit(:content)
  end
  def select_post
    @post = Post.find(params[:id])
  end
end
