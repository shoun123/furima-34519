require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do
    before do
      @item = FactoryBot.build(:item)
    end


    it "商品画像を1枚つけることが必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end


    it "商品の説明が必須であること" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end


    it "カテゴリーの情報が必須であること" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end


    it "商品の状態についての情報が必須であること" do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end


    it "配送料の負担についての情報が必須であること" do
      @item.delivery_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery must be other than 1")
    end


    it "発送元の地域についての情報が必須であること" do
      @item.area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end


    it "発送までの日数についての情報が必須であること" do
      @item.day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1")
    end


    it "販売価格についての情報が必須であること" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end


    it "販売価格は、¥300以下では保存できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end


    it "販売価格は、¥9,999,999以上では保存できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end


    it "販売価格は半角数字のみ保存可能であること" do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end


  end
end