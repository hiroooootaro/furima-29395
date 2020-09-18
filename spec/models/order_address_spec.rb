require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe '購入機能' do
    context '商品購入がうまく行く時' do
      it "全ての情報が正しく入力されている" do
        expect(@order_address).to be_valid
      end
    end
    context '商品購入がうまくいない時' do
      it "郵便番号が空だと登録できない"  do
        @order_address.postal = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal can't be blank")
      end
      it "郵便番号に「ー」が入っていないと登録できない" do
        @order_address.postal = 1231234
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal is invalid")
      end
      it "prefecture_idが0だと登録できない" do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture Select")
      end
      it "cityが空だと登録できない" do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "cityがアルファベットだと登録できない" do
        @order_address.city= "abcd"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City is invalid")
      end
      it "addressが空だと登録できない" do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "addressにアルファベットが入っていると登録できない" do
        @order_address.address = "abcd"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address is invalid")
      end
      it "user_idが空だと登録できない" do
        @order_address.user_id = ""
        @order_address.valid? 
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと登録できない" do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
