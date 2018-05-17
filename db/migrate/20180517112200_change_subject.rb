class ChangeSubject < ActiveRecord::Migration[5.2]
  def change
	  remove_column :students, :encrypted_password
	  remove_column :students, :confirmation_token
	  remove_column :students, :remember_token
	    
    
  end
end