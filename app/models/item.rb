class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :condition_id
    validates :delivery_fee_id
    validates :shipped_from_fee_id
    validates :until_shipped_id

    with_options numericality: { other_than: 1 } do
      validates :category_id
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      with_options　numerically: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9,999,999 } do
        validates :price
      end
    end
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

end
