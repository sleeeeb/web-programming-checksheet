class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_information

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :start_date])
  end

  def get_information
    @genres = Genre.all.includes([:contents, :user_checks])
    todo_contents = []
    if current_user.present?
      @user_checks = current_user.user_checks
    end
    @todo_contents = todo_contents
  end
end
