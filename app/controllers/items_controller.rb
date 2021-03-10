class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @articles = Article.order("created_at DESC")
    @item = Item.new
      # if current_user == @items.user
      #   redirect_to root_path
      # end
    end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end

  end


  private
  def item_params
    params.require(:item).permit(:product, :category_id, :price, :status_id, :delivery_id, :area_id, :day_id, :description, :image).merge(user_id: current_user.id)
  end

end
