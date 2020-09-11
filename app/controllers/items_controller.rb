class ItemsController < ApplicationController
  def index
    #@articles = Article.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create 
    @item = items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :delivery_fee_id, :area_id, :day_id, :price, :user)
  end
end
