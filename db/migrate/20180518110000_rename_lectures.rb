class RenameLectures < ActiveRecord::Migration[5.2]
	def change
		rename_table :subjects, :lectures
		
	end
end