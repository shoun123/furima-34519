class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect, only: [:edit, :update, :destroy]
  before_action :item_edit, only: [:edit, :update]


  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:product, :category_id, :price, :status_id, :delivery_id, :area_id, :day_id, :description, :image).merge(user_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end


  def redirect
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
  end


  def item_edit
    if @item.history.present?
      redirect_to root_path
    end
  end
end
