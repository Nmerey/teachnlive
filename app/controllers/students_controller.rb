class StudentsController < ApplicationController
	def index
		@student = Student.all
	end

	def create
		@student = Student.new(first_name: params["student"]["first_name"], last_name: params["student"]["last_name"], phone: params["student"]["phone"], email: params["student"]["email"])
		@student.save
		redirect_to '/'
	def create_from_omniauth
	    auth_hash = request.env["omniauth.auth"]
	    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)
	    p "============================================"
	    p authentication
	    p "============================================"
	    # if: previously already logged in with OAuth
	    if authentication.student
	    	current = DateTime.now
	    	diffrence_in_hours = ((current.to_i - authentication.updated_at.to_i) * 24)
	    	if 	diffrence_in_hours < 2 
			    student = authentication.student
			    p "============================================"
			    p student
			    p "============================================"
			    authentication.update_token(auth_hash)
		      	@next = root_url
	      		flash[:notice] = "Attendance Taken"
			else
				@next = root_url
	      		flash[:notice] = "Your attendance have been taken just now"
			end
	    # else: user logs in with OAuth for the first time
	    else
	      p "====================================="
	      p "in the SessionsController"
	      p "============================="
	      # user = User.create_with_auth_and_hash(authentication, auth_hash)
	      student = Student.create_with_auth_and_hash(authentication, auth_hash)
	      # you are expected to have a path that leads to a page for editing user details
	      @redirect = root_path
	      flash[:notice] = "Student have attend the class"
	  	end
	  	
	  	redirect_to '/'
	end


end