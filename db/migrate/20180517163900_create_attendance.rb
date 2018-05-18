class CreateAttendance < ActiveRecord::Migration[5.2]
  def change
    create_table :attendance do |t|
      t.timestamps 
      t.datetime :date
      t.boolean :present, default: false
      t.references :subject, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
    end

    remove_column :subjects, :attendance
  end
end