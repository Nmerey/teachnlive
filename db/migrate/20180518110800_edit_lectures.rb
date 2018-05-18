class EditLectures< ActiveRecord::Migration[5.2]
	
	def change

	
		add_column :lectures, :subject_name, :string
		add_column :lectures, :start_date, :date
		add_column :lectures, :end_date, :date
	end

end