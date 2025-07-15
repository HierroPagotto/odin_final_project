class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    current_user.likes.create(post: post) unless post.likes.exists?(user: current_user)
    redirect_back fallback_location: post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    like = post.likes.find_by(user: current_user)
    like.destroy if like
    redirect_back fallback_location: post_path(post)
  end
end
