class UsersController < ApplicationController
  def enter
    render layout: nil
  end

  def about; end

  def index; end

  def show
    @user = User.find(params[:id])
    @trophys = @user.trophies
  end
end
