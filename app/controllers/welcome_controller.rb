class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  def name
    @property = Property.find(params[:id])
    @name = @property.user.name
  end

  def index
    @cart = cart
  end


  def add
    id = params[:id]
    cart[id] ? cart[id] = cart[id] + 1 : cart[id] = 1
    flash[:notice] = "Added to cart"
    redirect_to :back
  end

  def clearCart
    session[:cart] = nil
    redirect_to action: :index
  end


  def about
  end


  def dashboard
    @properties = current_user.properties.paginate(page: params[:page], per_page: 1)
    @appointments = current_user.appointments
    @favorites = current_user.favorites.paginate(page: params[:page], per_page: 3)
    @comments = Comment.where(property_id: @property).order("created_at DESC")
    @products = Product.all
    @cart = cart
    @advertisements = Advertisement.all


    if current_user.buyer?
      render :buyer_dashboard
    else
      render :seller_dashboard
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price, :category)
  end
end
