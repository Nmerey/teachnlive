class Clean < ActiveRecord::Migration[5.2]
  def change
  	remove_column :attendances, :date
  	remove_column :lectures, :student_id
  	remove_column :lectures, :start_date
  	remove_column :lectures, :end_date
  end
end
