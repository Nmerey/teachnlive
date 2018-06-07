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
	    # search for authentication object of the student
	    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)
	    if authentication.student
	    	# get student object by using the authentication object
		    student = authentication.student
		    authentication.update_token(auth_hash)
 	  		@attendance = Attendance.update(lecture_id: cookies[:lecture].to_i, student_id: authentication.student_id,present: true)



		    # if cookies[:new_lecture] != nil && cookies[:second_lecture] == nil
		    #   attendance = Attendance.new
		    #   attendance.lecture_id = cookies[:new_lecture].to_i
		    #   attendance.student_id = authentication.student_id
		    #   attendance.save
		    #   cookies[:second_lecture] = cookies[:new_lecture]
		    #   # cookies.delete :new_lecture
		    #   flash[:success] = "Successfully Sign Up For the NEw CLass"
		    #   return redirect_to root_path
		    # end

		 #    if cookies[:old_lecture] == cookies[:exist_lecture] || cookies[:second_lecture] == cookies[:exist_lecture]
		 #      	attendance = Attendance.find_by(student_id: authentication.student_id, lecture_id:  cookies[:exist_lecture])
			#     if attendance == nil
			#     	flash[:danger] = "I can See some cheating you want to do there"
			#     	return redirect_to '/'
			#     else
			#     	attendance.present = true
			#     	attendance.save
		 #      		flash[:notice] = "Attendance Taken"
		 #      		return redirect_to root_path
			#     end
			# else
			# 	byebug
			# 	flash[:warning] =  "Something Wrong with Cookie logic"
			# 	return redirect_to root_path
			# end
	    else
	    #   x = Student.find_by(first_name: auth_hash["info"]["first_name"])
	  	 #  if cookies[:new_lecture] != nil
	  	 #  	if x 
			  # authentication.update_token(auth_hash)
		   #  else
	    #   	  student = Student.create_with_auth_and_hash(authentication, auth_hash)
		   #  end
		   #    attendance = Attendance.new
		   #    attendance.lecture_id = cookies[:new_lecture].to_i
		   #    attendance.student_id = authentication.student_id
		   #    attendance.save
		   #    cookies[:old_lecture] = cookies[:new_lecture]
		   #    cookies.delete :new_lecture
		   #    # cookies[:new_lecture] =  nil
		   #    @redirect = root_path
		   #    flash[:notice] = "You Have Successfully Sign Up For the Class"
		   #    return redirect_to root_path
	  	 #  else 
	  	 #  	flash[:danger] = "You Didn't Register For that Course"
	  	 #  	return redirect_to root_path
 	  	#   end
 	  		x = Student.find_by(email: auth_hash["info"]["email"])
 	  		x.destroy
 	  		@student = Student.create_with_auth_and_hash(authentication, auth_hash)
 	  		@attendance = Attendance.create(lecture_id: cookies[:lecture].to_i, student_id: authentication.student_id,present: true)
	  	end
	  	redirect_to root_path
	end

	def new_student
		@list_lecture = Lecture.all
	end

	def sign_up
		cookies[:new_lecture] = params[:lecture_id]
		redirect_to "/auth/google_oauth2"
	end
end