class ChangeForeignKeyForAttendances < ActiveRecord::Migration[5.2]
  def change
  	rename_column :attendances, :subject_id, :lecture_id
  end
end
