class GenresController < ApplicationController
  def index
    @genres=Genre.all
  end
  
  def show
    @genre=Genre.find(params[:id])
    @num=@genre.contents.first.id
    
     if UserCheck.find_by(user_id:current_user.id,genre_id: params[:id]).present?
        @user_check = UserCheck.find_by(user_id:current_user.id,genre_id: params[:id])
        
     else
        @user_check = UserCheck.new
        @user_checks = Genre.find(params[:id]).contents.length.times do 
          @user_check.checkild
        end  
      end
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
    redirect_to root_path
    # respond_to do |format|
    #   if @user_check.save
    #     format.html { redirect_to root_path, notice: 'User check was successfully created.' }
    #     format.json { render :show, status: :created, location: @user_check }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user_check.errors, status: :unprocessable_entity }
    #   end
    # end
  end
  def update
    @user_check = current_user.user_checks.update(user_check_params)
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