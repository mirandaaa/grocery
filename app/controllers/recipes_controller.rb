class RecipesController < ApplicationController
  include RecipesHelper
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.items.build
  end

  def show
    @steps = @recipe.steps.split(",").each(&:strip)
  end

  def create
    @recipe = RecipeManager.build_recipe(recipe_params)
    if @recipe.save
      flash.notice = "Recipe '#{@recipe.name}' Created!"
      redirect_to recipe_path(@recipe)
    else
      flash.notice = "Recipe '#{@recipe.name}' could not be created!"
      redirect_to new_recipe_path
    end
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    flash.notice = "Grocery recipe '#{@recipe.name}' Updated!"
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy
    flash.notice = "Grocery recipe '#{@recipe.name}' Deleted!"
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :desc, :steps, items_attributes: [:id, :name, :category_id] )
  end
end
