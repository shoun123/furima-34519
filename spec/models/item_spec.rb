require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do
    before do
      @item = FactoryBot.build(:item)
    end


    it '正しく記入されていれば出品できる' do
      expect(@item).to be_valid
    end


    it "商品名が必須であること" do
      @item.product = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product can't be blank")
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
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end


    it "商品の状態についての情報が必須であること" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end


    it "配送料の負担についての情報が必須であること" do
      @item.delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery must be other than 1")
    end


    it "発送元の地域についての情報が必須であること" do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end


    it "発送までの日数についての情報が必須であること" do
      @item.day_id = 1
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
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end


    it "販売価格は、¥9,999,999以上では保存できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end


    it "販売価格は半角数字のみ保存可能であること" do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end


    it "価格が全角半角数字混合では出品できない" do
      @item.price = "123１２３"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end


    it "価格が半角英字のみでは出品できない" do
      @item.price = "aaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end


    it "価格が半角英数字混合では出品できない" do
      @item.price = "123aaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")

    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end


  end
end