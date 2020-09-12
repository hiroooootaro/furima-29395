class ItemsController < ApplicationController
  def index
    #@item = Article.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create 
    #binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :delivery_fee_id, :area_id, :day_id, :price, :item_image).merge(user_id: current_user.id)
  end
end
