class StudentsController < ApplicationController
	def index
		@student = Student.all
	end

	def create
		@student = Student.new(first_name: params["student"]["first_name"], last_name: params["student"]["last_name"], phone: params["student"]["phone"], email: params["student"]["email"])
		@student.save
		redirect_to '/'
	end

	def create_from_omniauth
	    auth_hash = request.env["omniauth.auth"]
	    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)
	    p "============================================"
	    p 2
	    p authentication
	    p "============================================"
	    if authentication.student && cookies[:old_lecture] == cookies[:exist_lecture] || authentication.student && cookies[:second_lecture] == cookies[:exist_lecture]
		    student = authentication.student
		    p "============================================"
		    p 1
		    p student
		    p "============================================"
		    authentication.update_token(auth_hash)
	      	attendance = Attendance.find_by(student_id: authentication.student_id, lecture_id:  cookies[:old_lecture])
	      	if attendance == nil 
	      		attendance = Attendance.find_by(student_id: authentication.student_id, lecture_id:  cookies[:second_lecture])
	      	end
	      	p "========================"
	      	p "trywvsyb"
	      	p attendance
	      	p "========================"
		    if attendance == nil
		    	flash[:danger] = "I can See some cheating you want to do there"
		    	return redirect_to '/'
		    else
		    	attendance.present = true
		    	attendance.save
	      		flash[:notice] = "Attendance Taken"
	      		return redirect_to root_path
		    end
	    else
	      p "====================================="
	      p "in the SessionsController"
	      p "============================="
	      x = Student.find_by(first_name: auth_hash["info"]["first_name"])
	  	  if cookies[:new_lecture] != nil
	      	  student = Student.create_with_auth_and_hash(authentication, auth_hash)
		      attendance = Attendance.new
		      attendance.lecture_id = cookies[:new_lecture].to_i
		      attendance.student_id = authentication.student_id
		      attendance.save
		      cookies[:second_lecture] = cookies[:new_lecture]
		      cookies[:old_lecture] = cookies[:new_lecture]
		      cookies[:new_lecture] =  nil
		      @redirect = root_path
		      flash[:notice] = "You Have Successfully Sign Up For the Class"
		      return redirect_to root_path
	  	  else 
	  	  	flash[:danger] = "You Didn't Register For that Course"
	  	  	return redirect_to root_path
 	  	  end
	  	end
	  	# redirect_to '/'
	end
	
	def new_student
		@list_lecture = Lecture.all
	end

	def sign_up
		cookies[:new_lecture] = params[:lecture_id]
		# attendance = Attendance.new
  #       attendance.lecture_id = cookies[:new_lecture].to_i
  #       attendance.student_id = authentication.student_id
  #       attendance.save
  #       cookies[:second_lecture] = cookies[:new_lecture]
  #       cookies[:old_lecture] = cookies[:new_lecture]
  #       cookies[:new_lecture] =  nil
	 #    flash[:notice] = "You Have Successfully Sign Up For the Class"
		redirect_to "/auth/google_oauth2"
	end
end