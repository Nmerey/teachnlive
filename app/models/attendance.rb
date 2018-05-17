class Attendance < ApplicationRecord
	belongs_to :subject
	has_many :students
	
	
end