# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

uid = []

2.times do
  @user = User.new
  @user.name = Faker::Name.name
  @user.email = Faker::Internet.free_email
  @user.password =  "abc"
  @user.save

  uid << @user.id
  
end

lecture = []

2.times do
  @lecture = Lecture.new
  @lecture.name = Faker::SiliconValley.character
  @lecture.user_id = uid.sample
  @lecture.subject_name =  Faker::Science.element
  @lecture.time = Faker::Time.between(2.days.ago, Date.today, :day)
  @lecture.save
  lecture << @lecture.id
end

aid = []

100.times do

  @student = Student.new
  @student.first_name = Faker::Name.first_name
  @student.last_name = Faker::Name.last_name
  @student.phone = Faker::PhoneNumber.cell_phone
  @student.email = Faker::Internet.free_email
  @student.save
  
  @auth = Authentication.new
  @auth.uid = SecureRandom.hex(10)
  @auth.token = SecureRandom.hex(10)
  @auth.provider = "google"
  @auth.student_id = @student.id
  @auth.save

  condition = [true,false]

  @attendance = Attendance.new
  @attendance.lecture_id = lecture.sample
  @attendance.student_id = @student.id
  @attendance.present = condition.sample
  @attendance.save
  aid << @attendance.id
end

date = [Date.current - 6.days,Date.current - 1.days,Date.current - 2.days,Date.current - 3.days,Date.current - 4.days,Date.current - 5.days,Date.current - 7.days]

7.times do
  p date.sample
end

aid.each do |x|
  y = Attendance.find(x)
  y.updated_at = date.sample
  y.save
end