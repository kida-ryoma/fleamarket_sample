class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :new]
  before_action :set_item, except: [:index, :new, :create]
  
  def index
    
  end

  def show
  end

  def new
    @item = Item.new
    @item.item_images.new
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
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  
  private
  def item_params
    params.
      require(:item)
        permit(:name, :description, :brand,
        :price, :size, :sales_status,
        :category_id, :status_id, :area_id,
        :order_id, :user_id, :delivery_id,
        item_images_attributes: [:image, :_destory, :id])
        .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[id])
  end


end
