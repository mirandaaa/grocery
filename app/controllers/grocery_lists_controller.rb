class GroceryListsController < ApplicationController
  include GroceryListsHelper

  def index
    @lists = GroceryList.all
  end

  def new
    @list = GroceryList.new
  end

  def show
    @list = GroceryList.find(params[:id])
  end

  def create
    @list = GroceryList.new(list_params)
    @list.save

    flash.notice = "Grocery List '#{@list.name}' Created!"

    redirect_to grocery_list_path(@list)
  end

  def edit
    @list = GroceryList.find(params[:id])
  end

  def update
    @list = GroceryList.find(params[:id])
    @list.update(list_params)

    flash.notice = "Grocery List '#{@list.name}' Updated!"

    redirect_to grocery_list_path(@list)
  end

  def destroy
    @list = GroceryList.find(params[:id])
    @list.destroy

    flash.notice = "Grocery List '#{@list.name}' Deleted!"

    redirect_to grocery_lists_path
  end

  def add_item
    @list = GroceryList.find(params[:id])
    @category = Category.find(params[:grocery_list][:category_id])
    @list.add_item(params[:grocery_list][:item_name], @category.name)
    redirect_to grocery_list_path(@list.id)
  end
end
