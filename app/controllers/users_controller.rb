class UsersController < ApplicationController
  def enter
    render :layout => nil
  end

  def about
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    @trophys = []
    case @user.comments.length
    when 100...20000
      @trophys << Trophy.find(8)
      @trophys << Trophy.find(9)
      @trophys << Trophy.find(10)
      @trophys << Trophy.find(11)
    when 50...100
      @trophys << Trophy.find(8)
      @trophys << Trophy.find(9)
      @trophys << Trophy.find(10)
    when 10...50
      @trophys << Trophy.find(8)
      @trophys << Trophy.find(9)
    when 1...10
      @trophys << Trophy.find(8)
    end

    case @user.likes.length
    when 50...20000
      @trophys << Trophy.find(12)
      @trophys << Trophy.find(13)
    when 10...50
      @trophys << Trophy.find(12)
    end
  end
end
