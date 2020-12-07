require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase).to be_valid
    end
    it 'tokenが無いと保存できない' do
      @purchase.token = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end
    it 'zip_codeが空だと保存できない' do
      @purchase.zip_code = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Zip code can't be blank")
    end
    it 'zip_codeが半角数字で○○○-○○○○の形でなければ保存できない' do
      @purchase.zip_code = "2740807"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Zip code is invalid")
    end
    it 'prefecture_idが空だと保存できない' do
    end
    it 'prefecture_idが1だと保存できない' do
    end
    it 'cityが空だと保存できない' do
    end
    it 'house_numberが空だと保存できない' do
    end
    it 'phone_numberが空だと保存できない' do
    end
    it 'house_numberが空だと保存できない' do
    end
    it 'phone_numberが空だと保存できない' do
    end
    it 'phone_numberが12桁以上だと保存できない' do
    end
    it 'phone_numberが9桁以下だと保存できない' do
    end
  end
end