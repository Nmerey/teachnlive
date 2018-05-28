class ChangeColumnForAttendances < ActiveRecord::Migration[5.2]
  def change
  	# remove_foreign_key :attendances, :lecture
  	# add_foreign_key :attendances, :lecture, index: true

  end
end
