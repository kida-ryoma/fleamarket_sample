class HomesController < ApplicationController
  def index
    @items = Item.all.map do |item|
      item unless item.order
    end.compact
  end
end