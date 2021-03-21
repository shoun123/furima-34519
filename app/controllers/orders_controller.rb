class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address_history, only: [:index, :create]
  before_action :redirect, only: [:index, :create]


  def index
    @address_history = AddressHistory.new
  end

  def create
    @address_history = AddressHistory.new(address_params)
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

  def set_address_history
    @item = Item.find(params[:item_id])
  end

  def redirect
    if @item.user.id == current_user.id || @item.history.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,   # 商品の値段
      card: address_params[:token],     # カードトークン
      currency: 'jpy'                   # 通貨の種類（日本円）
    )
  end


end

