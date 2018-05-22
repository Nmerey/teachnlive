class Name < ActiveRecord::Migration[5.2]
  def change
  	remove_column :authentications, :user_id
    add_reference :authentications, :student, foreign_key: true
  end
end
