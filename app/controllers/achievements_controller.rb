class AchievementsController < ApplicationController
  def new
    @achievement=Achievement.new
  end
  def create
    current_user.create(params)
  end

  private
  def group_params
     params.require(:achievement).permit(:level,:content_id,:flag})
   end


end