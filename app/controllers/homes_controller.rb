class HomesController < ApplicationController
  def index
    @items = Item.all.where(order_id:nil)
    
  end
end
