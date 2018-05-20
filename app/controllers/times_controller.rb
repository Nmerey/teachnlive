class TimeController < ApplicationController

 	def create
 		@class_time = Time.new
 		@start_time = params["start"]
 		@end_time = params["end"]
 		@subject_id = params["subject_id"]
 		if @class_time.save
 			flash[:success] = "Class Time Successfully set"
 		else
 			flash[:danger] = "Something Wrong with the Input"
 		end
 	end
end