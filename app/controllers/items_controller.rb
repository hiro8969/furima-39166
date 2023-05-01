class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
    @items = Item.all
  end
end
