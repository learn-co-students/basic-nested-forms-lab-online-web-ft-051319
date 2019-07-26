class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(quantity: 'recipe_ingredients_attributes_0_quantity',name: 'recipe_ingredients_attributes_0_name')
    @recipe.ingredients.build(quantity: 'recipe_ingredients_attributes_1_quantity',name: 'recipe_ingredients_attributes_1_name')
  end

  def create
    recipe=Recipe.create(recipe_params)
    redirect_to recipes_path
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:name,:quantity])
  end
end
