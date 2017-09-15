class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  around_filter :user_time_zone, if: :current_user

  #Makes cart available in views.
  helper_method :cart

  # Ensure cart session hash exists, if not, it creates a new one with its Value to a blank hash.

  def cart
    session[:cart] ||= {}
  end


  def after_signup_path_for(resource)

  end


  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache, :time_zone) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar, :time_zone) }
  end
end
