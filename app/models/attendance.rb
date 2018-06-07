class Attendance < ApplicationRecord
	belongs_to :lecture
	has_many :students

	scope :attendance_count, -> (lec_id) {(where("lecture_id=? AND present=?",lec_id,true)).length}
	scope :attendance_all, -> (lec_id) {(where("lecture_id=?",lec_id)).length}
end