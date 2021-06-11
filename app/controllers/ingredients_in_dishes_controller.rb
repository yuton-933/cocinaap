class IngredientsInDishesController < ApplicationController

  def create
    dish = Dish.find_by(id: params[:dish_id])
    ingredient_in_dish = dish.ingredients_in_dishes.build(ingredients_in_dish_params)
    if ingredient_in_dish.save
      redirect_to dishes_path
      flash[:notice] = "料理に材料を登録しました"
    else
      redirect_to new_dish_ingredients_in_dish_path
      flash[:alert] = "登録に失敗しました"
    end  
  end

  def destory
    ingredient_in_dish = IngredientsInDish.find_by(ingredient_id: params[:ingredient_id], dish_id: params[:dish_id])
    ingredient_in_dish.destoroy
  end  

private
  def ingredients_in_dish_params
    params.permit(
      :dish_id, :ingredient_id, :unit, :gram
    )
  end
end
