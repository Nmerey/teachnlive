class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.timestamps null: false
      t.string :name
      t.boolean :attendance, default: false
      t.references :user, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true
    end
  end
end