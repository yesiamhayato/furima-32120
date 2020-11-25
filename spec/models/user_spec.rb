require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "一意性の無いemailは登録できない" do
    end
    it "emailには＠が無いと登録できない" do
    end
    it "passwordが無い場合登録できない" do
    end
    it "passwordは6文字以上無い場合登録できない" do
    end
    it "passwordが半角英数字混合でない場合登録できない" do
    end
    it "password_confirmationが空欄の場合登録できない" do
    end
    it "password_confirmationがpasswordと一致しない場合登録できない" do
    end
    it "last_nameが空だと登録できない" do
    end
    it "first_nameが空だと登録できない" do
    end
    it "last_name_kanaが空だと登録できない" do
    end
    it "first_name_kanaが空だと登録できない" do
    end
    it "last_name_kanaに全角カタカナで入力されていないと登録できない" do
    end
    it "first_name_kanaに全角カタカナで入力されていないと登録できない" do
    end
    it "dateが空だと登録できない" do
    end
  end
end
