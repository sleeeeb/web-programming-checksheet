class ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def show
    @content = Content.find(params[:id])
    @comments = @content.comments
    @comment = Comment.new
  end

  def create; end

  def privacy_policy; end

  def edit; end
end
