class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create 
    @item = items.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :delivery_fee_id, :area_id, :day_id, :price, :user)
  end
end
