class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end


  def show
  end


  def new
    @advertisement = Advertisement.new
  end


  def edit
    @advertisement = Advertisement.find(params[:id])

  end

  def create
    @advertisement = Advertisement.new(advertisement_params)

    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to @advertisement, notice: 'Advertisement was successfully created.' }

      else
        format.html { render :new }

      end
    end
  end


  def update
    respond_to do |format|
      if @advertisement.update(advertisement_params)
        format.html { redirect_to @advertisement, notice: 'Ad was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end


  def destroy
    @advertisement.destroy
    respond_to do |format|
      format.html { redirect_to advertisements_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def advertisement_params
    params.require(:advertisement).permit(:title, :description, :image_url, :profession, :advert_name, :zip, :contact_info, :vouch)
  end
end




