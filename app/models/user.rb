class User < ApplicationRecord
 has_many :subjects
 # has_many :authentications, dependent: :destroy
  include Clearance::User

  enum roles: [:teacher, :admin]

 #  def self.create_with_auth_and_hash(authentication, auth_hash)
 #   p "====================================="
 #   p "in the user model"
 #   p "in the create create_with_auth_and_hash"
 #   p "====================================="
 #   user = self.create!(
 #     name: auth_hash["info"]["name"],
 #     email: auth_hash["info"]["email"],
 #     password: SecureRandom.hex(10),
 #     roles: 1
 #   )
 #   p "--------------------------------------"
 #   p user
 #   p authentication
 #   p "--------------------------------------"
 #   user.authentications << authentication
 #   return user
 # end

 # # grab google to access google for user data
 # def google_token
 #   p "====================================="
 #   p "in the user model"
 #  p "in the google_token"
 #   p "====================================="
 #   x = self.authentications.find_by(provider: 'google_oauth2')
 #   return x.token unless x.nil?
 # end

end
