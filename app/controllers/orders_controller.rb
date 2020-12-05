class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(order_params)
  end

  private
  def order_params
    params.permit( :zip_code, :prefecture_id, :city, :house_number, :building_number )
  end

end
