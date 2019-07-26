class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to recipe
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipe
  end

  private

    def recipe_params
      params.require(:recipe).permit(
        :title, 
        ingredient_attributes: [
          :name, 
          :quanitity,
          :id ]
        )
      
    end

end
