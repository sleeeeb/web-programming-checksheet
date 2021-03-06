class SignupsController < ApplicationController
  def sms_confirmation_send
    @profile = Profile.new
    flash.delete(:notice)
  end

  def sms_confirmation_certify
    @profile = current_user.profile.assign_attributes(profile_params)
    if current_user.profile.valid?(:sms_confirmation_send)
      current_user.profile.update(profile_params)
    else
      @profile = Profile.new
      @errors = '未記入箇所があります'
      render 'sms_confirmation_send'
    end
  end

  def oauth
    @user = User.new
    @user.email = session['devise.google_data']['info']['unverified_email'] if session['devise.google_data']
    @user.email = session['devise.facebook_data']['info']['email'] if session['devise.facebook_data']
  end

  def oauth_facebook
    @user = User.new
    @user.email = session["devise.facebook_data"]['info']['email']
  end

  def index; end

  def new; end

  def show; end

  def succesful; end

  private

  def profile_params
    params.require(:profile).permit(:phone_number, :family_name, :last_name, :kana_family_name, :kana_last_name, :postalcode, :address_prefecture, :address_city, :address_street_number, :address_building_name)
  end

  def use_check_address_nil?
    false
  end
end
