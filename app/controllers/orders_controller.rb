class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  require"payjp"

  def new
    Order.new
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
    Order.create(seller_id: @item.user_id, buyer_id: current_user.id, item_id: @item_id)
    @credit_card = CreditCard.where(user_id: current_user.id).first
    Payjp.api_key = ENV['SECRET_KEY']
    Payjp::Charge.create(
    amount: @item.price,
    customer: Payjp::Customer.retrieve(@credit_card.customer_id),
    currency: 'jpy'
    )
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
