class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    following_ids = current_user.followings.pluck(:id)
    @posts = Post.where(user_id: [current_user.id] + following_ids).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
