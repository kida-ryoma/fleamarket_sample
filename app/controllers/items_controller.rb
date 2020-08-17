class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :new, :create, :get_category_children, :get_category_grandchildren]
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]
  
  def index
    
  end

  def show
  end

  def new
    @item = Item.new
    @item.item_images.build
    @category_parent_array = ["---"]
    @category_parent_array = Category.where(ancestry: nil)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
      # redirect_to item_path(@item.id)
    end
  end
  
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  
  
  
  private
  def item_params
    params.
      require(:item)
        .permit(:name, :description, :brand,
        :price, :size, :sales_status,
        :status_id, :prefecture_code,
        :category_id, :delivery_responsibility_id,
        :order_id, :user_id,:preparation_day_id,
        item_images_attributes:[:image, :_destory, :id])
        .merge(user_id: 1)
        #ユーザー登録が現状ないので、1としてしています。
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
