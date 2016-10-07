class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def destroy
    @group = Group.find(params[:group_id])
    @post = Post.destroy
    flash[:alert] = "Group deleted"
    redirect_to groups_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
