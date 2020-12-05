class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create

  end

  private
  def order_params

  end

end
