class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.save
    @list = GroceryList.find(params[:grocery_list_id])
    @list.add_item(@item.name, "Fresh Produce")
    redirect_to grocery_list_path(@list.id)
  end

  def new
    @list = GroceryList.find(params[:grocery_list_id])
    @categories = Category.all
    @item = Item.new
  end

  def item_params
    params.require(:item).permit(:name, :category, :grocery_list_id)
  end
end
