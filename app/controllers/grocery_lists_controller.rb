class GroceryListsController < ApplicationController
  include GroceryListsHelper
  before_action :find_list, only: [:show, :edit, :update, :destroy, :add_item, :delete_item]

  def find_list
    @list = GroceryList.find(params[:id])
  end

  def index
    @lists = GroceryList.all
  end

  def new
    @list = GroceryList.new
  end

  def show
  end

  def create
    @list = GroceryList.new(list_params)
    @list.save
    flash.notice = "Grocery List '#{@list.name}' Created!"
    redirect_to grocery_list_path(@list)
  end

  def edit
  end

  def update
    @list.update(list_params)
    flash.notice = "Grocery List '#{@list.name}' Updated!"
    redirect_to grocery_list_path(@list)
  end

  def destroy
    @list.destroy
    flash.notice = "Grocery List '#{@list.name}' Deleted!"
    redirect_to grocery_lists_path
  end

  def add_item
    @category = Category.find(params[:grocery_list][:category_id])
    @list.add_item(params[:grocery_list][:item_name], @category.name)
    redirect_to grocery_list_path(@list)
  end

  def delete_item
    @item = Item.find(params[:item_id])
    @list.items.delete(@item)
    redirect_to grocery_list_path(@list)
  end
end
