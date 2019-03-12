class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  def name
    @property = Property.friendly.find(params[:id])
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
    @properties = current_user.properties.includes(appointments: [:user]).paginate(page: params[:properties_page], per_page: 1)
    @appointments = current_user.appointments.includes([:user, :slots])
    @favorites = current_user.favorites.includes(:property).paginate(page: params[:favorites_page], per_page: 3)
    @products = Product.all
    @cart = cart
    @advertisements = Advertisement.all
    @scheduled = current_user.posts.where(state: "scheduled").paginate(page: params[:scheduled_page], per_page: 4).order("scheduled_at ASC")
    @history = current_user.posts.where.not(state:"scheduled").paginate(page: params[:history_page], per_page: 4).order("scheduled_at DESC")
    @posts = current_user.posts
    @post = Post.new(content: "Hey, I've decided to sell my house on www.Moverable.com. Check it out at:")
    @past_purchases = current_user.store_purchases

    if current_user.role.blank?
      redirect_to choose_type_path and return

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
