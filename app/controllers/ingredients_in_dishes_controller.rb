class IngredientsInDishesController < ApplicationController

  before_action :set_ingredients_in_dish, only: %i(destroy edit update show) 
  require 'byebug'
  def create
    dish = Dish.find_by(id: params[:dish_id])
    ingredients_in_dish = dish.ingredients_in_dishes.build(ingredients_in_dish_params)
    if ingredients_in_dish.save
      redirect_to dishes_path
      flash[:notice] = "料理に材料を登録しました"
    else
      redirect_to new_dish_ingredients_in_dish_path
      flash[:alert] = "登録に失敗しました"
    end  
  end

  def destroy
    @ingredients_in_dish.destroy
    flash[:notice] = "データを破棄しました" 
    rescue
      flash[:alert] = "データの削除に失敗しました"
    ensure
      redirect_to dishes_path
  end  

  def edit 
  end
  
  def update
    byebug
    @ingredients_in_dish.update(ingredients_in_dish_params)
    flash[:notice] = "データを更新しました" 
    redirect_to dishes_path 
    rescue
      render 'edit'
      flash[:alert] = "データの更新に失敗しました"
  end
  

private
  def ingredients_in_dish_params
    params.permit(
      :dish_id, :ingredient_id, :unit, :gram, 
    )
  end

  def set_ingredients_in_dish
    @ingredients_in_dish = IngredientsInDish.find_by(id: params[:id])
  end
end
