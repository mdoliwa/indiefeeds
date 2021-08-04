class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @parent_comment = Comment.find(params[:comment_id])

    @comment = @post.comments.new(parent: @parent)
  end

  def create
    @post = Post.find(params[:post_id])

    @post.comments.create(comment_params.merge(user: current_user))
    
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end

