class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "flour", quantity: "1 cup" )
    @recipe.ingredients.build(name: "sugar", quantity: "2 tbsp" )
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  private 

  def recipe_params()
    params.require(:recipe).permit(
      :title, 
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )

  end
end
