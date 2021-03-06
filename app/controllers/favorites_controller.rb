class FavoritesController < ApplicationController

  def create
    @property = Property.friendly.find(params[:property_id])
    favorite = current_user.favorites.build(property: @property)
    @user = @property.user

    if favorite.save
      current_user.update_attribute(:progress_has_favorited, true)
      redirect_to :back, notice: "Created favorite and added to dashboard."

    else
      redirect_to :back, notice: "Please try to create favorite again."
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    #Find the current user's favorite with the ID in the params

    if @favorite.destroy
      redirect_to :back, notice: "You deleted that favorite."
    else
      redirect_to :back, notice: "Error. Try again."
    end
  end

end