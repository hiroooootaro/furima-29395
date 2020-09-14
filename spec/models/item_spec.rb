require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
    @item.item_image = fixture_file_upload('public/images/test_image.png')
  end

  describe '' do
    it '画像がないと登録できない' do
      @item.item_image = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item image can't be blank")
    end
    it '商品名が空だと登録できない' do
      @item.name=""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明が空だと登録できない' do
      @item.description=""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank") 
    end
    it 'カテゴリー情報が必須であること' do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")

    end
    it '商品の状態についての情報が必須であること' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")

    end
    it '発送元の地域についての情報が必須であること' do
      @item.area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 0")

      
    end
    it '配送料の負担についての情報が必須であること' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")

    end
    it '発送までの日数の情報が必須であること' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")

      
    end
    it '価格が空だと登録できない' do
      @item.price=""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格は半角数字でないと登録できない' do
      @item.price="１２３"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")

    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price=  99999999
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

  end
end
