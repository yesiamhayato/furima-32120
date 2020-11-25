require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "abcdefgh@gmail.com", password: "12345abcdef", password_confirmation: "12345abcdef", last_name: "遠藤", first_name: "太郎", last_name_kana: "エンドウ", first_name_kana: "タロウ", birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "Taro", email: "", password: "12345abcdef", password_confirmation: "12345abcdef", last_name: "遠藤", first_name: "太郎", last_name_kana: "エンドウ", first_name_kana: "タロウ", birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "一意性の無いemailは登録できない" do
    end
    it "emailには＠が無いと登録できない" do
      user = User.new(nickname: "Taro", email: "abcdefghgmail.com", password: "12345abcdef", password_confirmation: "12345abcdef", last_name: "遠藤", first_name: "太郎", last_name_kana: "エンドウ", first_name_kana: "タロウ", birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが無い場合登録できない" do
      user = User.new(nickname: "Taro", email: "abcdefgh@gmail.com", password: "", password_confirmation: "12345abcdef", last_name: "遠藤", first_name: "太郎", last_name_kana: "エンドウ", first_name_kana: "タロウ", birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end
    it "passwordは6文字以上無い場合登録できない" do
      user = User.new(nickname: "Taro", email: "abcdefgh@gmail.com", password: "123ab", password_confirmation: "123ab", last_name: "遠藤", first_name: "太郎", last_name_kana: "エンドウ", first_name_kana: "タロウ", birthday: "1990-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
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
