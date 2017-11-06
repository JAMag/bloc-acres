class StorePurchasesController < ApplicationController
  def show
    @store_purchase = StorePurchase.find_by_uuid(params[:id])
  end
end