require 'rails_helper'

    # user = User.new(nickname: "abe", email: "test@test.com", password: "1234567", password_confirmation: "1234567")
    user = User.new(nickname: "田中くん", last_name: "田中", first_name: "太郎", last_furigana: "タナカ", first_furigana: "タロウ", birthday: "19800410", email: "test@test.com", password: "1234567", password_confirmation: "1234567")

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do


    it "メールアドレスが必須であること" do
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      user.save
      # another_user = User.create(nickname: "田中くん", last_name: "田中", first_name: "太郎", last_furigana: "タナカ", first_furigana: "タロウ", birthday: "19800410", email: user.email, password: "1234567", password_confirmation: "1234567")
      another_user = User.create(nickname: "田中くん", last_name: "田中", first_name: "太郎", last_furigana: "タナカ", first_furigana: "タロウ", birthday: "19800410", email: "test@test.com", password: "1234567", password_confirmation: "1234567")
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end


    it "メールアドレスは、@を含む必要があること" do
      # user.email.delete!("@")
      user.email = "testtest.com"
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end


    it 'passwordが空では登録できないこと' do
      user.password = ''
      user.password_confirmation = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end


    it 'passwordが6文字以上であれば登録できること' do
      user.password = '12345'
      user.password_confirmation = '12345'
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end


    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      user.password = '123456'
      user.password_confirmation = '1234567'
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


  end
end



