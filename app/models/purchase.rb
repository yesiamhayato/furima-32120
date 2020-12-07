class Purchase
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :zip_code, :prefecture_id, :city, :house_number, :building_name, :phone_number
  with_options presence: true do
    validates :token
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
  end


  def save
    @order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      zip_code: zip_code,
      prefecture_id: prefecture_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      phone_number: phone_number,
      order_id: @order.id
    )
  end
end