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
	    # if cookies[:lecture] != cookies[:sign_up_lecture]
	    if authentication.student && cookies[:old_lecture] == cookies[:new_lecture]
	    	# current = DateTime.now
	    	# diffrence_in_hours = ((current.to_i - authentication.updated_at.to_i) * 24)
			    student = authentication.student
			    p "============================================"
			    p 1
			    p student
			    p "============================================"
			    authentication.update_token(auth_hash)
	    	# if 	diffrence_in_hours < 2
		      	attendance = Attendance.find_by(student_id: authentication.student_id, lecture_id:  cookies[:old_lecture])
		      	attendance = Attendance.find_by(student_id: authentication.student_id, lecture_id:  cookies[:second_lecture])
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
			    end
		      	@next = root_url
	      		flash[:notice] = "Attendance Taken"
	    else
	      p "====================================="
	      p "in the SessionsController"
	      p "============================="
	      x = Student.find_by(first_name: auth_hash["info"]["first_name"])
	      if x == nil
	      	student = Student.create_with_auth_and_hash(authentication, auth_hash)
	  	  else
	  	  	authentication.update_token(auth_hash)
	  	  end 
	      attendance = Attendance.new
	      # attendance.present = true
	      attendance.lecture_id = cookies[:new_lecture].to_i
	      attendance.student_id = authentication.student_id
	      attendance.save
	      cookies[:second_lecture] = cookies[:new_lecture]
	      cookies[:old_lecture] = cookies[:new_lecture]
	      cookies[:new_lecture] =  nil
	      # you are expected to have a path that leads to a page for editing user details
	      @redirect = root_path
	      flash[:notice] = "You Have Successfully Sign Up For the Class"
	  	end
	  	p '============================================'
	  	p 'cookies '
	  	p cookies[:lecture]
	  	p '============================================'
	  	redirect_to '/'
	end
	
	def new_student
		@list_lecture = Lecture.all
	end

	def sign_up_lecture
		cookies[:new_lecture] = params[:lecture_id]
		redirect_to "/auth/google_oauth2"
	end
end