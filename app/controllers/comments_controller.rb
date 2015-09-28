class CommentsController < ApplicationController

  def create
    post = Post.find(params[:comment][:post_id])
    Comment.create(params_comment)
    redirect_to post_path(post)
  end

  private

  def params_comment
    params.require(:comment).permit(:content,:post_id)
  end

end
