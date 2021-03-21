require 'rails_helper'

RSpec.describe AddressHistory, type: :model do
  describe "商品購入機能" do
    before do
      @address_history = FactoryBot.build(:address_history)
    end


    context '商品が購入出来る時' do

      it '正しく記入されていれば購入できる' do
        expect(@address_history).to be_valid
      end

      it '建物番号がなくても購入できる' do
        @address_history.building_number = ""
        @address_history.valid?
        expect(@address_history).to be_valid
      end

    end


    context '商品購入ができない時' do

      it '市町村が必須であること' do
        @address_history.municipalities = ""
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Municipalities can't be blank")
      end

      it '番地が必須であること' do
        @address_history.address = ""
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Address can't be blank")
      end

      it '郵便番号が必須であること' do
        @address_history.postal_code = ""
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号でハイフンが必須であること' do
        @address_history.postal_code = "1234567"
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Postal code is invalid")
      end

      it "郵便番号が全角半角数字混合では出品できない" do
        @address_history.postal_code = "123-１２３４"
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Postal code is invalid")
      end

      it "郵便番号が半角英数字混合では出品できない" do
        @address_history.postal_code = "123-aaaa"
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Postal code is invalid")
      end

      it '電話番号が必須であること' do
        @address_history.phone_number = ""
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号にハイフンがいらない' do
        @address_history.phone_number = "123-1234-1234"
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が全角半角数字混合では出品できない' do
        @address_history.phone_number = "１２３12341234"
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Phone number is invalid")
      end

      it "郵便番号が半角英数字混合では出品できない" do
        @address_history.phone_number = "aaa12341234"
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Phone number is invalid")
      end

      it "発送元の地域についての情報が必須であること" do
        @address_history.area_id = 1
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Area must be other than 1")
      end

      it 'tokenが必須であること' do
        @address_history.token = ""
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空だと購入できない" do
        @address_history.user_id = ""
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空だと購入できない" do
        @address_history.item_id = ""
        @address_history.valid?
        expect(@address_history.errors.full_messages).to include("Item can't be blank")

      end
    end


  end
end
