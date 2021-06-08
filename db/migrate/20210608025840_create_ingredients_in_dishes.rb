class CreateIngredientsInDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients_in_dishes do |t|
      t.references :ingredient, null: false, foreign_key: true #材料のID
      t.references :dish, null: false, foreign_key: true #料理のID
      t.string :unit, null: false #分量（ex 1つ、1TBS、1匹、1cup）
      t.float :gram, null: false #上記の分量をgで。これを元にCalとcost計算
      t.timestamps
    end
  end
end
