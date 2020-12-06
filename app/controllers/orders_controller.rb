class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_params, only: [:index, :create]

  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    #binding.pry
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def item_params
    @item = Item.find(params[:item_id])
  end


  def pay_item
    Payjp.api_key = "sk_test_475f6015b8c25ad822ce9133"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def purchase_params
    params.require(:purchase).permit( :zip_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id)
  end

end
