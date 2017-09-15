class UserController < ApplicationController


  def index
  end

  def about
  end

  def update_type
    current_user.update_attributes(params.require(:user).permit(:role))
    if current_user.role == 'buyer'
      redirect_to new_subscriber_path
    else
      redirect_to dashboard_path
    end
  end


  def choose_type

  end

  def dashboard
    @properties = current_user.properties
    @appointments = current_user
    @slots = @properties.slots
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :time_zone)
  end
end