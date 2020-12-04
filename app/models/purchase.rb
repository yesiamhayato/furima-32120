class Purchase
  include ActiveModel::Model
  attr_accessor :number, :cvc, :exp_month, :exp_year, :user_id, :item_id, :zip_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end