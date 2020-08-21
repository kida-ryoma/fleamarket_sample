class OrdersController < ApplicationController
  # before_action :autenticate_user!
  # before_action :set_item
  # ↑ログイン機能と商品購入機能の実装まだの為コメントアウト

  require"payjp"

  def new
    @oreder  = Order.new
  end

  def create
    @order = Order.create(seller_id: @item.user_id, buyer_id: current_user.id, item_id: @item_id)
    Payjp.api_key = ENV['PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    redirect_to root_path
  end

  def purchase
  end

  def pay
    
  end

  private


  def set_item
    @item = item.find(params[:id])
  end

end
