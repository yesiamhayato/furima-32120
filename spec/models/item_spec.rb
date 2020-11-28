require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

    describe '新規商品出品' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空では登録できない" do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_infoが空では登録できない" do
        @item.item_info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it "category_idが1では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idが1では登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "delivery_feeが1では登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "shipped_from_idが1では登録できない" do
        @item.shipped_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipped from must be other than 1")
      end
      it "until_shipped_idが1では登録できない" do
        @item.until_shipped_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Until shipped must be other than 1")
      end
      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid", "Price is not a number")
      end
      it "priceに半角数字以外が入力されていたら登録できない" do
        @item.price = "はっぴゃくにじゅう"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
end
