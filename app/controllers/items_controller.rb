class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.category_id = params[:category_id]
    @item.save
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
