class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.order("created_at DESC")
    @items = Item.all
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

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_time_id, :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   item = Item.find(params[:id])
  #   if item.user_id != current_user.id
  #      redirect_to action: :index
  #   end
  # end
end
 
