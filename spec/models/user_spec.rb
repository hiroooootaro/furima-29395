require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "emailが一意てきであること" do
    end
    it "passwordが空だと登録できない" do
    end
    it "passwordが6文字以上であること" do
    end
    it "passwordが半角英数字のみであること" do
    end
    it "passwordとpassword_confirmationが一致すること" do
    end
    it "first_nameが空だと登録できない" do
    end
    it "first_name_kanaが空だと登録できない" do
    end
    it "last_nameが空だと登録できない" do
    end
    it "last_name_kanaが空だと登録できない" do
    end
    it "first_nameが全角（漢字、平仮名、カタカナ）で入力されていること" do
    end
    it "last_nameが全角（漢字、平仮名、カタカナ）で入力されていること" do
    end
    it "first_name_kanaが全角カタカナで入力されていること" do
    end
    it "last_name_kanaが全角カタカナで入力されていること" do
    end
  end
end