module GroceryListsHelper
  def list_params
    params.require(:grocery_list).permit(:name, :desc, :item_list)
  end
end
