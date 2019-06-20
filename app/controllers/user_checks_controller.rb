class UserChecksController < ApplicationController
require 'byebug'
  def index
    @genres=Genre.all
    @user_checks=current_user.user_checks
    texts=[]
    user_check=User.find(current_user.id).user_checks.each do |user_check| 
      checks=Check.where(user_check_id:user_check.id).where(["flag > ? ", 5])
      checks.each do |check|
        texts<< Content.find(check.content_id).text
      end
      @texts=texts
    end
  end
  def show
    @user_check = UserCheck.find_by(user_id:current_user.id)
    @checks=@user_check.checks.first
    end



  def new
      @user_check = UserCheck.new
      @user_checks = Content.last.id.times do 
        @user_check.checks.build
      end
  end
  def edit
    @user_check = UserCheck.find_by(user_id:current_user.id)
    @checks=@user_check.checks.firstend
  end

  def create
    @user_check = current_user.user_checks.create(user_check_params)
    @user_check.score = @user_check.checks.where(["level > ? ", 2]).length 
    @user_check.save
    current_user.update(rank: (current_user.rank.to_i + @user_check.score))
    redirect_to root_path

  end
  def update
    @user_check = current_user.user_checks.find_by(id: params[:id])
    @user_check.update(user_check_params)
    @user_check.score = @user_check.checks.where(["level > ? ", 2]).length 
    @user_check.saveexit

    redirect_to root_path
    
  end


  def user_check_params
    params.require(:user_check).permit(
    :genre_id,
    :user_id,
    checks_attributes: [:id,:level,:flag,:content_id]
    )
  end

end