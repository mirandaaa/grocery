class RecipeManager
  def self.build_recipe(recipe_params, item_params)
    @recipe = Recipe.new(name: recipe_params[:name], desc: recipe_params[:desc], steps: recipe_params[:steps])

    item_params.each { |item|
      c = Category.find(item[:category])
      i = Item.find_or_create_by(name: item[:name], category: c)
      ing = Ingredient.create(recipe: @recipe, item: i)
      @recipe.ingredients << ing
    }

    @recipe
  end

  def self.add_ingredient(recipe, item_name, category)
    new_or_found_item = Item.find_or_create_by(name: item_name, category: category)
    ingredient = Ingredient.create(item: new_or_found_item, recipe: recipe)
  end


end
