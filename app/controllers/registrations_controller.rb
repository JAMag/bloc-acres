class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    '/subscribers/new'
  end


  # social media marketer
  def sign_up_params
    params.require(:user).permit(:email, :password, :time_zone)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :time_zone, :current_password)
  end
  #end of social media marketer

end