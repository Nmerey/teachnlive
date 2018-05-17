class HomeController < ApplicationController
 
 	def index
 	end

 	def generate_qr_code
 		# search for current subject in database
 		# code.....
 		# generate the link for it 
 		@qr = RQRCode::QRCode.new( 'http://github.com/', :size => 4, :level => :h )
 	# 	@qrcode = RQRCode::QRCode.new("http://github.com/")
		# svg = @qrcode.as_svg
		# # With default options specified explicitly
		# svg = qrcode.as_svg(
		# 	offset: 0, color: '000', 
	 #        shape_rendering: 'crispEdges', 
  #           module_size: 11
  #           )
  		# p @qr
  # 		@qr = RQRCode::QRCode.new( 'my string to generate', :size => 4, :level => :h )
		# puts @qr.to_s
 		# respond_to do |format|
 		# 	format.html
 		# 	format.json
 		# end
 	end





 	# take the student coordinate
 	# def student_attend
	 # 	student_lat = params["lat"].to_f
	 # 	student_lng = params["lng"].to_f
	 # 	p student_lat.to_f
	 # 	p student_lng.to_f
	 # 	calculate_distance(student_lat,student_lng)
 	# end

 	# pass the value of student coordinate and take set point from the database 
 	# def calculate_distance(student_lat,student_lon)
 	# 	puts "inside calculate_distance"
 	# 	class_lat = 3.134873
 	# 	class_lng = 101.6277528
 	# 	distance = distance([class_lat, class_lng], [student_lat, student_lon])
 	# 	puts distance
 	# end

 	private

 	# this function is to calculate the diatance between two point
 	#############################################
 	# def distance(loc1, loc2)
 	#   rad_per_deg = Math::PI/180  # PI / 180
 	#   rkm = 6371                  # Earth radius in kilometers
 	#   rm = rkm * 1000             # Radius in meters

 	#   dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
 	#   dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

 	#   lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
 	#   lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

 	#   a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
 	#   c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

 	#   rm * c # Delta in meters
 	# end

end
