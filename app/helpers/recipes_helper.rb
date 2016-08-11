module RecipesHelper
  def recipe_params
    params.require(:recipe).permit(:name, :desc, :steps)
  end
end
