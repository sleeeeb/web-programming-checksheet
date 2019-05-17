class GenresController < ApplicationController

  def show
    @genre = Genre.find(params[:id])
    @user_check = UserCheck.new
    @user_checks = @genre.contents.last.id.times do 
    @user_check.checks.build
  end

  def update
    Genre.update(user_check_params)
    redirect_to root_path
  
  end

  def user_check_params
    params.require(:genre).permit(
    checks_attributes: [:check_id,:level,:flag,:content_id]
    )
  end
end
