class PostsController < ApplicationController
  before_action :select_post, only: [:edit, :update, :destroy]
  before_action :set_all_post, only: [:index, :create, :confirm]
  def index
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if params[:back]
      render :index
    else
      if @post.save
        redirect_to posts_path,
        notice: "あなたのぼやきを投稿しました！"
      else
        render :index
      end
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
  def confirm
    @post = Post.new(post_params)
    render :index if @post.invalid?
  end
  private
  def post_params
    params.require(:post).permit(:content)
  end
  def select_post
    @post = Post.find(params[:id])
  end
  def set_all_post
    @posts = Post.all.order(created_at: :desc)
  end
end
