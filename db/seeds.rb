# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Seed Student
 student = {}

ActiveRecord::Base.transaction do
  50.times do 
    student['first_name'] = Faker::Name.first_name 
    student['last_name'] = Faker::Name.last_name
    student['email'] = Faker::Internet.email
    student['phone'] = Faker::PhoneNumber.phone_number


    Student.create(student)
  end
end 

#Seed users
user = {}
user['password'] = '1234'


ActiveRecord::Base.transaction do
  10.times do 
    user['name'] = Faker::Name.name 
    user['email'] = Faker::Internet.email   


    User.create(user)
  end
end 

#Seed lectures
lecture = {}

ActiveRecord::Base.transaction do
	5.times do
		lecture['name'] = rand["Morning", "Afternoon", "Night"]
		lecture['subject_name'] = rand["Chemistry", "Mathematics", "Coding", "Psychology"]
		lecture['start_date'] = Date.today
		lecture['end_date'] = Date.forward(120)
	end
end



#Seed attendances

attendance = {}

ActiveRecord::Base.transaction do
	50.times do
		attendance['lecture_id'] = rand(1..10)
		attendance['student_id'] = rand(1..50)
		attendance['present'] = Faker::Boolean.boolean

	end
end