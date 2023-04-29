class ItemsController < ApplicationController

  def index
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
    params.require(:item).permit(:item_name, description, :price, :image).merge(user_id: current_user.id)
  end
end
#  :category_id, :condition_id, :shipping_cost_id, :shipping_time_id, :prefecture_id,
