class Student < ApplicationRecord
	has_many :lectures
	has_many :attendances
	has_many :authentications, dependent: :destroy


	def self.create_with_auth_and_hash(authentication, auth_hash)
	   student = self.create!(
	     first_name: auth_hash["info"]["first_name"],
	     last_name: auth_hash["info"]["last_name"],
     	 phone: auth_hash["info"]["phone"],
	     email: auth_hash["info"]["email"]
	   )
	   student.authentications << authentication
	   return student
	 end

  # grab google to access google for user data
	def google_token
		x = self.authentications.find_by(provider: 'google_oauth2')
		return x.token unless x.nil?
	end
end
