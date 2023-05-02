class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index

  def new
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def buy_params
    params.require(:buy_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end

end
