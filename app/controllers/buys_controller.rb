class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: :index
  before_action :prevent_url, only: [:index, :create]

  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'                
      )
       @buy_address.save
       return redirect_to root_path
    else
      render :index
    end
  end

  private
  def buy_params
    params.require(:buy_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
    redirect_to root_path
    end  
  end 

  def prevent_url
    if @item.user_id == current_user.id || @item.buy.present?
      redirect_to root_path
    end
  end
end
