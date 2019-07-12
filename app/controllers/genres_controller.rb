class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @comments = Comment.all
  end

  def show
    @genre = Genre.find(params[:id])
    @num = @genre.contents.first.id
    return true if @user_check = UserCheck.find_by(user_id: current_user.id, genre_id: params[:id])

    @user_check = UserCheck.new
    Genre.find(params[:id]).contents.length.times { @user_check.checks.build }
  end

  def new
    @user_check = UserCheck.new
    @user_checks = Content.last.id.times do
      @user_check.checks.build
    end
  end

  def edit
    @user_check = UserCheck.find_by(user_id: current_user.id)
    @checks = @user_check.checks.firstend
  end

  def create
    @user_check = current_user.user_checks.create(user_check_params)
    redirect_to root_path
  end

  def update
    @user_check = current_user.user_checks.update(user_check_params)
    redirect_to root_path
  end

  def user_check_params
    params.require(:user_check).permit(
      :genre_id,
      :user_id,
      checks_attributes: %i[id level flag content_id]
    )
  end
end
