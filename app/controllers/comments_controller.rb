class CommentsController < ApplicationController
  def index
@contents=Content.all
  end

  def show
    @content=Content.find(params[:id])
    @comment=Comment.new
  end

  def create
    @comment=current_user.comments.create!(comment_params)
    redirect_to content_url(id: @comment.content_id)

  end

  def edit

  end
  private

  def comment_params
    params.require(:comment).permit(:text,:content_id)
  end

end