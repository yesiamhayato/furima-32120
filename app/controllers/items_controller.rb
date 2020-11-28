class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :sign_up, :sign_in]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :category_id, :price, :condition_id, :delivery_fee_id, :shipped_from_id, :until_shipped_id, :image).merge(user_id: current_user.id)
  end
end
