class OrdersController < ApplicationController
  before_action :set_items,only: [:index, :create, :pay_item]
  before_action :move_to_index, only: [:index]
  before_action :move_to_index2, only: [:index]
  def index
  end

  def new
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def order_params
    params.permit(:token, :postal, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    
      currency:'jpy'                 
    )
  end

  def set_items
    @item = Item.find(params[:item_id])
  end

  def move_to_index 
    if user_signed_in? && current_user.id == @item.user_id 
    redirect_to root_path
    end
  end

  def move_to_index2
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
