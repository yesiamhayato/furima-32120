class Purchase
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :zip_code, :prefecture_id, :city, :house_number, :building_name, :phone_number
  with_options presence: true do
    #validates :token
    #validates :user_id
    #validates :item_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number
  end


  def save
    @order = Order.create(item_id: item_id, user_id: user_id)
    Address.create
  end
end