class IngredientsController < ApplicationController

  require 'byebug'

  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.present?
      # byebug
      @ingredient.save
      redirect_to root_path
      flash[:notice] = "材料を登録しました"
    else
      redirect_to root_path
      flash[:alert] = "登録に失敗しました"
    end
  end

  def ingredient_params
    params.require(:ingredient).permit(
        :title, :meat, :dairy_egg, :seafood, :other_animal, 
        :allergen, :protein, :fat, :carbs, :cost
    )
  end

  
end
