class SessionsController < Clearance::SessionsController
  

  # def create_from_omniauth
  #   auth_hash = request.env["omniauth.auth"]
  #   authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)
  #   p "============================================"
  #   p authentication
  #   p "============================================"
  #   # if: previously already logged in with OAuth
  #   if authentication.user
  #       user = authentication.user
  #     p "============================================"
  #       p user
  #     p "============================================"
  #       authentication.update_token(auth_hash)
  #       @next = root_url
  #       @notice = "Signed in!"
  #     # else: user logs in with OAuth for the first time
  #   else
  #    p "====================================="
  #     p "in the SessionsController"
  #     p "============================="
  #     # user = User.create_with_auth_and_hash(authentication, auth_hash)
  #     user = User.create_with_auth_and_hash(authentication, auth_hash)
  #     # you are expected to have a path that leads to a page for editing user details
  #     @redirect = root_path
  #     @notice = "Student have attend the class"
  #   end

  #   sign_in(user)
  #   redirect_to @redirect, :notice => @notice
  # end
end