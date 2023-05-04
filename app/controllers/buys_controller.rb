class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :move_to_index, only: :index

  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy = Buy.find(params[:buy_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      Payjp.api_key = "sk_test_d2d8c740a4775263dab084bd"
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: buy_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
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
    if @item.user_id != current_user.id
      redirect_to root_path
    end  
  end
end
