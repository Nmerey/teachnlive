class AddTimeForLectures < ActiveRecord::Migration[5.2]
  def change
  	add_column :lectures, :time, :string
  end
end
