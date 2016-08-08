module GroceryListHelper
  def grocery_list_params
    params.require(:grocery_list).permit(:name, :desc, :item_list)
  end
end
