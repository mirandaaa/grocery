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
    redirect_to grocery_list_path(@list)
  end

  def update
  end

end
