require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do

    before do
      @user = FactoryBot.build(:user)
    end

    it "メールアドレスが必須であること" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end


    it "メールアドレスが一意性であること" do
      @user.email = "test@test.co.jp"
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end


    it "メールアドレスは、@を含む必要があること" do
      @user.email = "testtest.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end


    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end



    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '12345a'
      @user.password_confirmation = '12345a'
      expect(@user).to be_valid
    end


    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end


    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password = '12345a'
      @user.password_confirmation = '123456a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it "last_nameは空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end


    it "first_nameは空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end


    it "last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end


    it "first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end


    it "last_furiganaは空では登録できない" do
      @user.last_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last furigana can't be blank")
    end


    it "first_furikanaは空では登録できない" do
      @user.first_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First furigana can't be blank")
    end


    it "last_furiganaは全角（カタカナ）でなければ登録できない" do
      @user.last_furigana = '11111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last furigana is invalid")
    end


    it "first_furikanaは全角（カタカナ）でなければ登録できない" do
      @user.first_furigana = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("First furigana is invalid")
    end

  end
end


