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
    # Collection of produce items in that list
    @produce = @list.items.where(category_id: 1)
    # Collection of meat/fish items in that list
    @meat_fish = @list.items.where(category_id: 2)
    # Collection of dairy/egg items in that list
    @dairy_eggs = @list.items.where(category_id: 3)
    # Collection of grains items in that list
    @grains = @list.items.where(category_id: 4)
    # Collection of snacks items in that list
    @snacks = @list.items.where(category_id: 5)
    # Collection of canned/jar items in that list
    @canned_jar = @list.items.where(category_id: 6)
    # Collection of baking items in that list
    @baking = @list.items.where(category_id: 7)
    # Collection of frozen items in that list
    @frozen = @list.items.where(category_id: 8)
    # Collection of misc items in that list
    @misc = @list.items.where(category_id: 9)
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
