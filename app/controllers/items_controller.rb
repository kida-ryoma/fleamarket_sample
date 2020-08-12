class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, except: :index 
  def index
  end

  def show
  end

  def new
  end

  def create
  end
  
  
  private
  def itme_params
    params.
      require(:item)
        permit(:name, :description, :brand,
        :price, :size, :sales_status,
        :category_id, :status_id, :area_id,
        :order_id, :user_id, :delivery_id,
        item_images_attributes:[:image])
        .merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[id])
  end


end
