class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.timestamps null: false
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
    end
  end
end