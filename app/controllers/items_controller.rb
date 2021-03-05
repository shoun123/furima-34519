class ItemsController < ApplicationController
  def index
    @items = Item.new
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end


  private
  def item_params
    params.require(:item).permit(:product, :category_id, :price, :status_id, :delivery_id, :area_id, :day_id, :user, :description)
  end

end
