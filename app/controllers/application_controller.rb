class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_information 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def get_information
    @genres=Genre.all
    texts=[]
    if current_user.present?
    user_check=User.find(current_user.id).user_checks.each do |user_check| 
      checks=Check.where(user_check_id:user_check.id).where(["flag > ? ", 5])
      checks.each do |check|
        texts<< Content.find(check.content_id).text
      end
    end
      @texts=texts

    end
  end

end