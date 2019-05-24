class UsersController < ApplicationController

  def show
  
  @trophys=[]
  case current_user.comments.length
  when 100...20000
    @trophys << Trophy.find(8)
    @trophys << Trophy.find(9)
    @trophys << Trophy.find(10)
    @trophys << Trophy.find(11)
  when  50...100
    @trophys << Trophy.find(8)
    @trophys << Trophy.find(9)
    @trophys << Trophy.find(10)
  when 10...50
    @trophys << Trophy.find(8)
    @trophys << Trophy.find(9)
  when 1...10
    @trophys << Trophy.find(8)  
  end

  case current_user.likes.length
  when 50...20000
    @trophys << Trophy.find(12)
    @trophys << Trophy.find(13)
  when 10...50
    @trophys << Trophy.find(12)  
  end

end
end