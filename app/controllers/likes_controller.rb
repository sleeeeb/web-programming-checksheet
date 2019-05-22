class LikesController < ApplicationController
  def create
     @comment = Comment.find(params[:li][:comment_id])
    aa=@comment.likes.create(user_id:current_user.id)
    redirect_to content_url(id: @comment.content_id)     
  end

  def destroy
@like=Like.find(params[:id]).destroy
    redirect_to content_url(id: @like.comment.content_id)  
  end
private


  def likes_params
    params.require(:likes).permit(:user_id,:comment_id)
  end
end
