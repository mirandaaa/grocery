class WelcomeController < ApplicationController
  def index
    @recent_lists = GroceryList.recent
  end
end
