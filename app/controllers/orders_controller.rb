class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  require"payjp"

  def new
    @order  = Order.new
    @address = DeliveryDestination.where(user_id: current_user.id).first
    @user = current_user
    Payjp.api_key = ENV["SECRET_KEY"]
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      @card_info = customer.cards.retrieve(customer.default_card)
      @card_brand = @card_info.brand.to_s
      @exp_month = @card_info.exp_month.to_s
      @exp_year = @card_info.exp_year.to_s.slice(2,3)
      case @card_brand
      when "Visa" then
        @card_image = "Visa.gif"
      when "JCB" then
        @card_image = "JCB.png"
      when "MasterCard" then
        @card_image = "MasterCard.png"
      when "American Express" then
        @card_image = "AmericanExpress.png"
      when "Diners Club" then
        @card_image = "DinersClub.png"
      when "Discover" then
        @card_image = "Discover.gif"
      end
  end

  def create
    @order = Order.new(seller_id: @item.user_id)
    @credit_card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = ENV['SECRET_KEY']
    Payjp::Charge.create(
      # 支払いの処理を呼び出す
    amount: @item.price,
    # その商品の値段
    customer: Payjp::Customer.retrieve(@credit_card.customer_id),
    # 顧客が持っているカード情報を呼び出す
    currency: 'jpy'
    # 日本円で支払う
    )
    @order.update(buyer_id: current_user.id)
    @order.update(item_id: @item.id)
    @item.update(order_id: @item.id)
    redirect_to root_path
  end

  private


  def set_item
    @item = Item.find(params[:item_id])
    @item_images = @item.item_images
    @credit_card = CreditCard.where(user_id: current_user.id).first
  end

end
