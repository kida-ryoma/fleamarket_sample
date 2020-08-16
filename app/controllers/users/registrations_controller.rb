# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  require "payjp"

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] =  {user: @user.attributes}
    session["devise.regist_data"][:user][:password] = params[:user][:password]
    @phone_number = @user.build_phone_number
    render :new_phone_number
  end

  def create_phone_number
    @user = User.new(session["devise.regist_data"]["user"])
    @phone_number = PhoneNumber.new(phone_number_params)
    unless @phone_number.valid?
      flash.now[:alert] = @phone_number.errors.full_messages
      render :new_phone_number and return
    end
    session[:profile_attributes_after_step1] = sign_up_params[:phone_number]
    @address = @user.build_delivery_destination
    render :new_address
  end



  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @phone_number = PhoneNumber.new(session["phone_number"])
    @address = DeliveryDestination.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_delivery_destination(@address.attributes)
    @credit_card = @user.build_credit_card
    render :new_credit_card
  end

  def create_credit_card
    @user = User.new(session["devise.regist_data"]["user"])
    @phone_number = PhoneNumber.new(session["phone_number"])
    @address = DeliveryDestination.new(session["delivery_destination"])
      @credit_card = CreditCard.new(credit_card_params)
    # unless @credit_card.valid?
    #   flash.now[:alert] = @credit_card.errors.full_messages
    #   render :new_credit_card and return
    # end
    @user.build_delivery_destination(@address.attributes)
    @user.build_phone_number(@phone_number.attributes)
    @user.build_credit_card(@credit_card.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
    redirect_to root_path
  end

  protected


  def phone_number_params
    params.require(:phone_number).permit(:number)
  end

  def address_params
    params.require(:delivery_destination).permit(:delivery_family_name, :delivery_first_name, :delivery_family_name_kana, :delivery_first_name_kana, :delivery_phone_number, :post_code, :prefecture_code, :city, :house_number, :building_name)
  end

  def credit_card_params
    params.require(:credit_card).permit(:customer_id, :card_id)
  end
end
