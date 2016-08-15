class RecipeManager
  def self.build_recipe(recipe_params)
    @recipe = Recipe.new(name: recipe_params[:name], desc: recipe_params[:desc], steps: recipe_params[:steps])
    item_params = recipe_params[:items_attributes]

    item_params.each { |index, item|
      c = Category.find(item[:category_id].to_i)
      i = Item.find_or_create_by(name: item[:name], category: c)
      ing = Ingredient.create(recipe: @recipe, item: i)
      @recipe.ingredients << ing
    }

    @recipe
  end
end
