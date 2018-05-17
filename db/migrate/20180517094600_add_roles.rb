class AddRoles < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :roles , :integer, default: 0
  
  end
end
