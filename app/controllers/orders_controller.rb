class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :item_price
  require"payjp"

  def new
    if @credit_card.present?
      Order.new
      @address = DeliveryDestination.find_by(user_id: current_user.id)
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
    else
      redirect_to new_credit_card_path
    end
  end

  def create
      Payjp.api_key = ENV['SECRET_KEY']
      CreditCard.find_by(user_id: current_user.id)
      Payjp::Charge.create(
      amount: @item.price,
      customer: Payjp::Customer.retrieve(@credit_card.customer_id),
      currency: 'jpy'
      )
      redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
    @item_images = @item.item_images
    @credit_card = CreditCard.find_by(user_id: current_user.id)
  end

  def item_price
    @item = Item.find(params[:item_id])
    if @item.delivery_responsibility_id == 1
      @item_price = @item.price
    else
      @item_price = @item.price + 300
    end
  end

end
