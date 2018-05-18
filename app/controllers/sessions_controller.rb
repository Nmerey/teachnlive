class SessionsController < Clearance::SessionsController
  

  def create_from_omniauth
  auth_hash = request.env["omniauth.auth"]
  authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

  # if: previously already logged in with OAuth
  if authentication.student
    student = authentication.student
    
    authentication.update_token(auth_hash)
    @next = root_url
    @notice = "Signed in!"
  # else: user logs in with OAuth for the first time
  else
   p "====================================="
    p "in the SessionsController"
    p "============================="
    # user = User.create_with_auth_and_hash(authentication, auth_hash)
    student = Student.create_with_auth_and_hash(authentication, auth_hash)
    # you are expected to have a path that leads to a page for editing user details
    @notice = "Student created. Please confirm or edit details"
  end

  sign_in(user)
  redirect_to @next, :notice => @notice
  end
end