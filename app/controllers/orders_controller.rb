class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])

      if @item.user.id == current_user.id || @item.history.present?
        redirect_to root_path
      end

    @address_history = AddressHistory.new
  end

  def create
    @address_history = AddressHistory.new(address_params)
    @item = Item.find(params[:item_id])
    if @address_history.valid?
      pay_item
      @address_history.save
      return redirect_to root_path
    else
      render :index
    end
  end


  private

  def address_params
    params.require(:address_history).permit(:municipalities, :address, :postal_code, :building_number, :phone_number, :area_id ).merge(token: params[:token], item_id: params[:item_id]  , user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key = "sk_test_ff5989d889fb8624bc4a2c07"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,   # 商品の値段
      card: address_params[:token],     # カードトークン
      currency: 'jpy'                   # 通貨の種類（日本円）
    )
  end


end

