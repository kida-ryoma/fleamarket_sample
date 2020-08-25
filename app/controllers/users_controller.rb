class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user

  def show
    @user = User.find(params[:id])
    @user_items = @user.items.map do |item|
      item unless item.order
    end.compact
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
