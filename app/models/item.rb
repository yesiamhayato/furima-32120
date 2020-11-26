class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :shipped_from_id
      validates :until_shipped_id
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price
    end
    #with_options　numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } do
      #validates :price
    #end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :shipped_from
  belongs_to :until_shipped

end
