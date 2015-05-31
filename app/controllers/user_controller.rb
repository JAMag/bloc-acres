class UserController < ApplicationController
  def index
  end

  def about
  end

  def dashboard
    @properties = current_user.properties
    @appointments = current_user
    @slots = @properties.slots
  end
end