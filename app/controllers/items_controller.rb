class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
    # @item = Item.new(item_params)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
    @item = Item.new(item_params)
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_time_id, :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end
end
 
