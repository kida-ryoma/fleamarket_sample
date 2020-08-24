class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren, :search]

  
  def index
    
  end

  def show
    @item_images = @item.item_images
    @user_items = @item.user.items.where(order_id: nil)
    category_id = @item.category_id
    @category_items = Item.where(category_id: category_id)
  end

  def new
    @item = Item.new
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    if (@item.save) && (@item.item_images.present?)
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def edit
    @item.item_images.build
    # ログイン機能を未実装なのでコメントアウトしています
    # if current_user == @item.user_id
    #   @item.item_images.build
    # else
    #   redirect_to root_path
    # end
  end

  def update
    if @item.update(item_params) && (@item.item_images.present?)
      redirect_to root_path
    else
      redirect_to edit_item_path(@item)
    end
  end
  
  

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  
  
  def destroy_confirmation
  end

  def destroy
    if @item.destroy
      # redirect_to controller: :users, action: :show
      # 本当は↑に飛ばしたいが今ルーティングとアクションの設定がない
      redirect_to root_path
    else
      render :destroy_confirmation
    end
  end

  def search
    @items = Item.search(params[:keyword]).order("created_at DESC")
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
        item_images_attributes:[:image, :_destroy, :id])
        .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
