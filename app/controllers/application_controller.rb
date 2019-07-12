class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_information

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username start_date])
  end

  def user_information
    @genres = Genre.all.includes(%i[contents user_checks])
    return true unless user_signed_in?

    @user_checks = current_user.user_checks
    @todo_contents = current_user.checks.where(flag: 6)
  end
end
