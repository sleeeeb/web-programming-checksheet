class CommentsController < ApplicationController
  def index
@contents=Content.all
  end

  def show
    @content=Content.find(params[:id])
    @comment=Comment.new
  end

  def create
    @comment=current_user.comments.new(comment_params)
    if @comment.save
    redirect_to content_url(id: @comment.content_id)
    else
        flash[:error] = "コメントの登録に失敗しました"
    redirect_to content_url(id: @comment.content_id)
    end

  end

  def edit

  end
  private

  def comment_params
    params.require(:comment).permit(:text,:content_id)
  end

end