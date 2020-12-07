require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '正常系' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase).to be_valid
      end
    end

    context '異常系' do
      it 'tokenが無いと保存できない' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'zip_codeが空だと保存できない' do
        @purchase.zip_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが半角数字で○○○-○○○○の形でなければ保存できない' do
        @purchase.zip_code = '2740807'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Zip code is invalid')
      end
      it 'prefecture_idが空だと保存できない' do
        @purchase.prefecture_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it 'prefecture_idが1だと保存できない' do
        @purchase.prefecture_id = '1'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと保存できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できない' do
        @purchase.house_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @purchase.phone_number = '123456789012'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが9桁以下だと保存できない' do
        @purchase.phone_number = '123456789'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは数字のみでないと保存できない' do
        @purchase.phone_number = '201a982025'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
