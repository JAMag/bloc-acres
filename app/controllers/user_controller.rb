class UserController < ApplicationController

  before_action :user_params


  def index
  end

  def about
  end


  def dashboard
    @properties = current_user.properties
    @appointments = current_user
    @slots = @properties.slots
  end

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end