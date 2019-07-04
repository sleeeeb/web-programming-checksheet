class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_information

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :start_date])
  end

  def get_information
    @genres = Genre.all.includes([:contents, :user_checks])
    if user_signed_in?
      @user_checks = current_user.user_checks
      @todo_contents = current_user.checks.where(flag: 6)
    end
  end
end
