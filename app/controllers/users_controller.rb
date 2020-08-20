class UsersController < ApplicationController

  # ログイン機能未実装なのでコメントアウト中
  # before_action :authenticate_user!
  before_action :set_user

  def show
    @user = User.find(params[:id])
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
