class LecturesController < ApplicationController
# before_action :subject_params, only [:new]
 	# helper_method :calculate_attendance(sub_id)
 	def index
 		@lecture = Lecture.all
 		
 	end

 	def show
    	@lecture = Lecture.find(params[:id])
  	end

 	def new
 		@lecture = Lecture.new
 	end


 	def create
 	
 	
 	  @lecture = Lecture.new(name: params["lecture"]["name"], user_id: params["lecture"]["user_id"])

      @lecture.save
      redirect_to '/'
    end

    # def calculate_attendance(sub_id)
    # 	# if current_user.roles == "teacher"
    # 	# 	@subject = current_user.subject_id
    # 	# elsif current_user.roles = "admin"
    # 	# 	@subject = Subject.all
    # 	# end
    # 	@attendance = Attendance.where("subject_id = ? AND present = ? ", sub_id, true)
    # 	@attendance_count = @attendance.count
    # 	return @attendance_count
    # end

 	private

 	def set_lecture
      @lecture = Lecture.find(params[:id])
    end

end
