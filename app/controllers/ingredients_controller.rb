class IngredientsController < ApplicationController

  require 'byebug'
  before_action :set_ingredient, only: %i(destroy edit update)

  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.present?
      # byebug
      @ingredient.save
      redirect_to ingredients_path
      flash[:notice] = "材料を登録しました"
    else
      redirect_to new_ingredient_path
      flash[:alert] = "登録に失敗しました"
    end
  end

  def destroy
    @ingredient.destroy
    flash[:notice] = "データを破棄しました" 
    rescue
      flash[:alert] = "データの削除に失敗しました"
    ensure
      redirect_to ingredients_path
  end

  def index
    @ingredients = Ingredient.all.order('created_at ASC')
  end  

  def edit
  end  

  def update
    @ingredient.update(ingredient_params)
    flash[:notice] = "データを更新しました" 
    redirect_to ingredients_path 
    rescue
      render 'edit'
      flash[:alert] = "データの更新に失敗しました"
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(
          :title, :meat, :dairy_egg, :seafood, :other_animal, 
          :allergen, :protein, :fat, :carbs, :cost
      )
    end

    def set_ingredient
      @ingredient = Ingredient.find_by(id: params[:id])
    end

end
