# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]



  def new
    super
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render action: :new and return
    end
    session["devise.regist_data"] =  {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @phone_number = @user.build_phone_number
    render action: :new_phone_number
  end

  def create_phone_number
    @user = User.new(session["devise.regist_data"]["user"])
    @phone_number = Phone_number.new(phone_number_params)
    unless @phone_number.valid?
      flash.now[:alert] = @phone_number.errors.full_messages
      render action: :new_phone_number and return
    end
    @user.build_phone_number(@phone_number.attributes)
    @address = @user.build_address
    render action: :new_address
  end



  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @phone_number = Phone_number.new(session["phone_number"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    @credit_card = @user.build_credit_card
    render :new_credit_card
  end

  def create_credit_card
    @user = User.new(session["devise.regist_data"]["user"])
    @phone_number = Phone_number.new(session["phone_number"])
    @address = Address.new(session["address"])
    @credit_card = Credit_card.new(credit_card_params)
    # unless @credit_card.valid?
    #   flash.now[:alert] = @credit_card.errors.full_messages
    #   render :new_credit_card and return
    # end
    @user.build_address(@address.attributes)
    @user.build_phone_number(@phone_number.attributes)
    @user.build_credit_card(@credit_card.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  protected

  def sign_up_params
    params.permit(:nick_name, :email, :password, :password_confirmation)
  end

  def phone_number_params
    params.require(:phone_number).permit(:number)
  end

  def address_params
    params.require(:delivery_destinations).permit(:delivery_family_name, :delivery_first_name, :delivery_family_name_kana, :delivery_first_name_kana, :delivery_phone_number, :post_code, :prefecture_code, :city, :house_number, :building_name)
  end

  def credit_card_params
    params.require(:credit_card).permit(:customer_id, :card_id)
  end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
