class UsersController < ApplicationController

  before_action :autenticate_user!
  before_action :set_user

  def show
    @user = User.find(params[:id])
  end

  private
  def ser_user
    @user = User.find(params[:id])
  end
end
