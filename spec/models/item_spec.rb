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
      end
      it "condition_idが1では登録できない" do
      end
      it "delivery_feeが1では登録できない" do
      end
      it "shipped_from_idが1では登録できない" do
      end
      it "until_shipped_idが1では登録できない" do
      end
      it "priceが空では登録できない" do
      end
    end
end
