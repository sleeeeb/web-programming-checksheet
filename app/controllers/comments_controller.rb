class CommentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def show
    @content = Content.find(params[:id])
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    redirect_to content_url(id: @comment.content_id)
  end

  def edit
    @comment = Comment.find(params[:id])
    @content = @comment.content
  end

  def update
    @comment = Comment.find(params[:id]).update(comment_params)
    redirect_to content_url(params[:content_id])
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to content_url(params[:content_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :content_id)
  end
end
