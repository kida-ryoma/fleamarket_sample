class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card
  before_action :set_api_key, only: [:create,:destroy]

  def new
    @credit_card = CreditCard.where(user_id: current_user.id).first
    redirect_to credit_cards_path if @credit_card.present?
  end

  def create
    if params['payjp-token'].blank?
      render :new
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        # jsで作ったトークンを呼び出し、それをcustomerに代入
      )
      @credit_card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit_card.save
        redirect_to user_path(current_user.id)
      else
        redirect_to action: "create"
      end
    end
  end

  def index
    if @credit_card.present?
      # クレジットカードがあるか確認をする
      Payjp.api_key = ENV["SECRET_KEY"]
      # もしあれば秘密鍵を呼び出す
      customer = Payjp::Customer.retrieve(@credit_card.customer_id)
      # 顧客情報の呼び出し
      @card_info = customer.cards.retrieve(customer.default_card)
      # デフォルトカードとはカスタマーが現在持っているカード
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
    else redirect_to new_credit_card_path
    end
  end

  def destroy
    customer = Payjp::Customer.retrieve(@credit_card.customer_id.to_s)
    customer.delete
    if @credit_card.destroy
      redirect_to user_path(current_user.id)
    else
      redirect_to user_path(current_user.id)
    end
  end



  private
  def set_card
    @credit_card = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end

  def set_api_key
    Payjp.api_key = ENV["SECRET_KEY"]
  end
end
