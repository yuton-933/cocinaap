class AddNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null:false
    add_column :users, :admin, :boolean, null:false, default:false  
  end
end
