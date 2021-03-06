require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "passwordが半角英数字の混合であること" do
        @user.password = "000abc"
        @user.password_confirmation = "000abc"
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "emailが一意的であること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Email has already been taken")
      end
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank") 
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank") 
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank") 
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank") 
      end
      it "birth_dayが空だと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it "emailには@がないと登録できない" do
        @user.email = "aaaaaaaaaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password = "aaa123"
        @user.password_confirmation = ""
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("doesn't match Password")
      end
      it "first_nameが全角（漢字、平仮名、カタカナ）以外だと登録できない" do
        @user.first_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが全角（漢字、平仮名、カタカナ）以外だと登録できない" do
        @user.last_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_name_kanaが全角カタカナ以外だと登録できない" do
        @user.first_name_kana = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "last_name_kanaが全角カタカナ以外だと登録できない" do
        @user.last_name_kana = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
    end
  end
end