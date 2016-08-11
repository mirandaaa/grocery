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
  end

  def show
    @steps = @recipe.steps.split(",").each(&:strip)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    flash.notice = "Recipe '#{@recipe.name}' Created!"
    redirect_to recipe_path(@recipe)
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
end
