class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_item, except: [:index, :new, :create]
  
  def index
  end

  def show
    @item = Item.find(params[:id])
    @item_images = @item.item_images
    @user_items = @item.user.items.where(order_id: nil)
    category_id = @item.category_id
    @category_items = Item.where(category_id: category_id)
  end

  def new
  end

  def create
  end

  def edit
  end
  
  def destroy_confirmation
  end

  def destroy
    @item.destroy
    # redirect_to controller: :users, action: :show
    # 本当は↑に飛ばしたいが今ルーティングとアクションの設定がない
    redirect_to root_path
  end
  
  private
  def itme_params
    params.
      require(:item)
        permit(:name, :description, :brand,
        :price, :size, :sales_status,
        :category_id, :status_id, :area_id,
        :order_id, :user_id, :delivery_id,
        item_images_attributes:[:id, :item_id, :image])
        .merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
