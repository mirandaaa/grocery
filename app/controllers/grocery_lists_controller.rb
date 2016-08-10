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

end
