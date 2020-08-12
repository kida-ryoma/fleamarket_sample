class OrdersController < ApplicationController
  before_action :autenticate_user!
  before_action :set_item
  def new
    @oreder  = Order.new
  end

  def create
    @order = Order.create(seller_id: @item.user_id, buyer_id: current_user.id, item_id: @item_id)
  end

  private


  def set_item
    @item = item.find(params[:id])
  end

end
